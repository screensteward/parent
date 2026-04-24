import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:screensteward_parent/ipc/client.dart';
import 'package:screensteward_parent/screens/dashboard.dart';
import 'package:screensteward_parent/state/auth_controller.dart';

import '../support/mock_socket.dart';

GoRouter _router() => GoRouter(
  initialLocation: '/dashboard',
  routes: [
    GoRoute(path: '/dashboard', builder: (_, _) => const DashboardScreen()),
    GoRoute(
      path: '/login',
      builder: (_, _) =>
          const Scaffold(body: Center(child: Text('LOGIN-MARKER'))),
    ),
    GoRoute(
      path: '/policy-editor',
      builder: (_, _) =>
          const Scaffold(body: Center(child: Text('POLICY-MARKER'))),
    ),
    GoRoute(
      path: '/extensions',
      builder: (_, _) =>
          const Scaffold(body: Center(child: Text('EXT-MARKER'))),
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
  testWidgets('dashboard shows usage, policies, and pending extensions', (
    t,
  ) async {
    final mock = MockIpcServer();
    late SsIpcClient client;

    await t.runAsync(() async {
      await mock.start((req) {
        switch (req['method']) {
          case 'child.getStatus':
            return {
              'today_minutes_used': 60,
              'today_budget_minutes': 120,
              'current_window_open': true,
              'current_window_ends_at': null,
              'active_blocklist_display': ['steam'],
              'session_running': true,
            };
          case 'policy.list':
            return {
              'policies': [
                {
                  'id': 'pol-1',
                  'child_id': 'chi-1',
                  'scope': 'child',
                  'rules': [
                    {'type': 'daily_budget', 'minutes': 120},
                    {
                      'type': 'time_window',
                      'days': [1, 2, 3, 4, 5, 6, 7],
                      'start': '16:00:00',
                      'end': '20:00:00',
                    },
                  ],
                  'priority': 0,
                  'active_from': null,
                  'active_until': null,
                },
              ],
            };
          case 'extension.listPending':
            return {
              'pending': [
                {
                  'id': 'ext-1',
                  'child_id': 'chi-1',
                  'granted_by_parent_id': null,
                  'status': 'pending',
                  'reason': 'devoir de maths',
                  'duration_minutes': null,
                  'granted_at': null,
                  'expires_at': null,
                  'created_at': DateTime.now().toIso8601String(),
                },
              ],
            };
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

    // Usage card.
    expect(find.textContaining('60 / 120 min'), findsOneWidget);
    expect(find.text('Créneau ouvert'), findsOneWidget);
    expect(find.textContaining('Bloquées : steam'), findsOneWidget);

    // Policies card.
    expect(find.textContaining('Budget quotidien : 120 min'), findsOneWidget);
    expect(
      find.textContaining('Créneau 16:00:00 → 20:00:00'),
      findsOneWidget,
    );

    // Pending card.
    expect(
      find.text('Demandes en attente (1)'),
      findsOneWidget,
    );
    expect(find.textContaining('devoir de maths'), findsOneWidget);
  });

  testWidgets('dashboard logout navigates to /login', (t) async {
    final mock = MockIpcServer();
    late SsIpcClient client;

    await t.runAsync(() async {
      await mock.start((req) {
        switch (req['method']) {
          case 'child.getStatus':
            return {
              'today_minutes_used': 0,
              'today_budget_minutes': null,
              'current_window_open': false,
              'current_window_ends_at': null,
              'active_blocklist_display': [],
              'session_running': false,
            };
          case 'policy.list':
            return {'policies': []};
          case 'extension.listPending':
            return {'pending': []};
          case 'auth.logout':
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

    await t.tap(find.byKey(const Key('dashboard-logout')));
    await _settleWithRealIo(t);

    expect(find.text('LOGIN-MARKER'), findsOneWidget);
    expect(container.read(authControllerProvider).authenticated, isFalse);
  });
}
