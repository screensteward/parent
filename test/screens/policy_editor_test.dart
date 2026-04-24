import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:screensteward_parent/ipc/client.dart';
import 'package:screensteward_parent/screens/policy_editor.dart';
import 'package:screensteward_parent/state/auth_controller.dart';

import '../support/mock_socket.dart';
import '../support/test_app.dart';

GoRouter _router() => GoRouter(
  initialLocation: '/policy-editor',
  routes: [
    GoRoute(
      path: '/policy-editor',
      builder: (_, _) => const PolicyEditorScreen(),
    ),
    GoRoute(
      path: '/back',
      builder: (_, _) =>
          const Scaffold(body: Center(child: Text('BACK-MARKER'))),
    ),
  ],
);

Future<void> _settleWithRealIo(WidgetTester t, {int pumps = 6}) async {
  for (var i = 0; i < pumps; i++) {
    await t.runAsync(() async {
      await Future<void>.delayed(const Duration(milliseconds: 100));
    });
    await t.pump();
  }
}

void main() {
  testWidgets('editor hydrates from existing policy and saves via policy.update', (
    t,
  ) async {
    final mock = MockIpcServer();
    late SsIpcClient client;

    await t.runAsync(() async {
      await mock.start((req) {
        switch (req['method']) {
          case 'policy.list':
            return {
              'policies': [
                {
                  'id': 'pol-1',
                  'child_id': 'chi-1',
                  'scope': 'child',
                  'rules': [
                    {'type': 'daily_budget', 'minutes': 90},
                    {
                      'type': 'time_window',
                      'days': [1, 2, 3, 4, 5],
                      'start': '17:00:00',
                      'end': '19:00:00',
                    },
                  ],
                  'priority': 0,
                  'active_from': null,
                  'active_until': null,
                },
              ],
            };
          case 'policy.update':
            return {'ok': true};
        }
        return null;
      });
      client = await SsIpcClient.connect(mock.path);
    });
    addTearDown(() async {
      await client.close();
      await mock.stop();
    });

    final container = ProviderContainer(
      overrides: [ipcClientProvider.overrideWith((ref) async => client)],
    );
    addTearDown(container.dispose);
    container.read(authControllerProvider.notifier).markAuthenticated();

    await t.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: testRouterApp(_router()),
      ),
    );
    await _settleWithRealIo(t);

    // Editor hydrated from policy.list — budget label shows 90.
    expect(find.textContaining('90 min'), findsWidgets);

    // Tap Save without changes — must still send policy.update with the
    // existing id + current rules (confirms the wiring).
    await t.tap(find.byKey(const Key('policy-save-button')));
    await _settleWithRealIo(t);

    expect(mock.received.where((r) => r['method'] == 'policy.update'), hasLength(1));
    final update = mock.received.firstWhere(
      (r) => r['method'] == 'policy.update',
    );
    final params = update['params'] as Map;
    expect(params['id'], 'pol-1');
    final rules = params['rules'] as List;
    expect(rules[0], {'type': 'daily_budget', 'minutes': 90});
    expect((rules[1] as Map)['type'], 'time_window');
    expect((rules[1] as Map)['start'], '17:00:00');
    expect((rules[1] as Map)['end'], '19:00:00');
    expect((rules[1] as Map)['days'], [1, 2, 3, 4, 5]);
  });
}
