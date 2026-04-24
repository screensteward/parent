import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:screensteward_parent/ipc/client.dart';
import 'package:screensteward_parent/screens/extensions.dart';
import 'package:screensteward_parent/state/auth_controller.dart';

import '../support/mock_socket.dart';

GoRouter _router() => GoRouter(
  initialLocation: '/extensions',
  routes: [
    GoRoute(path: '/extensions', builder: (_, _) => const ExtensionsScreen()),
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
  testWidgets('approve sends extension.approve with picked duration', (
    t,
  ) async {
    final mock = MockIpcServer();
    late SsIpcClient client;

    await t.runAsync(() async {
      await mock.start((req) {
        switch (req['method']) {
          case 'extension.listPending':
            return {
              'pending': [
                {
                  'id': 'ext-42',
                  'child_id': 'chi-1',
                  'granted_by_parent_id': null,
                  'status': 'pending',
                  'reason': 'Encore 10 minutes SVP',
                  'duration_minutes': null,
                  'granted_at': null,
                  'expires_at': null,
                  'created_at': '2026-04-24T10:00:00Z',
                },
              ],
            };
          case 'extension.approve':
            return {'expires_at': '2026-04-24T10:30:00Z'};
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
        child: MaterialApp.router(routerConfig: _router()),
      ),
    );
    await _settleWithRealIo(t);

    // List rendered.
    expect(find.text('Encore 10 minutes SVP'), findsOneWidget);

    await t.tap(find.byKey(const Key('ext-approve-ext-42')));
    await t.pumpAndSettle();

    // Dialog appears — accept default 30 min.
    await t.tap(find.byKey(const Key('ext-duration-ok')));
    await _settleWithRealIo(t);

    final approveCall = mock.received.firstWhere(
      (r) => r['method'] == 'extension.approve',
    );
    final params = approveCall['params'] as Map;
    expect(params['ticket_id'], 'ext-42');
    expect(params['duration_minutes'], 30);
  });

  testWidgets('deny sends extension.deny', (t) async {
    final mock = MockIpcServer();
    late SsIpcClient client;

    await t.runAsync(() async {
      await mock.start((req) {
        switch (req['method']) {
          case 'extension.listPending':
            return {
              'pending': [
                {
                  'id': 'ext-99',
                  'child_id': 'chi-1',
                  'granted_by_parent_id': null,
                  'status': 'pending',
                  'reason': null,
                  'duration_minutes': null,
                  'granted_at': null,
                  'expires_at': null,
                  'created_at': '2026-04-24T10:00:00Z',
                },
              ],
            };
          case 'extension.deny':
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
        child: MaterialApp.router(routerConfig: _router()),
      ),
    );
    await _settleWithRealIo(t);

    await t.tap(find.byKey(const Key('ext-deny-ext-99')));
    await _settleWithRealIo(t);

    final denyCall = mock.received.firstWhere(
      (r) => r['method'] == 'extension.deny',
    );
    expect((denyCall['params'] as Map)['ticket_id'], 'ext-99');
  });
}
