import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:screensteward_parent/ipc/client.dart';
import 'package:screensteward_parent/screens/reports.dart';
import 'package:screensteward_parent/state/auth_controller.dart';

import '../support/mock_socket.dart';

GoRouter _router() => GoRouter(
  initialLocation: '/reports',
  routes: [
    GoRoute(path: '/reports', builder: (_, _) => const ReportsScreen()),
  ],
);

Future<void> _settle(WidgetTester t, {int pumps = 6}) async {
  for (var i = 0; i < pumps; i++) {
    await t.runAsync(() async {
      await Future<void>.delayed(const Duration(milliseconds: 100));
    });
    await t.pump();
  }
}

void main() {
  testWidgets('reports renders a LineChart from usage.getReport', (t) async {
    final mock = MockIpcServer();
    late SsIpcClient client;

    await t.runAsync(() async {
      await mock.start((req) {
        if (req['method'] == 'usage.getReport') {
          return {
            'child_id': 'chi-1',
            'from': '2026-04-18',
            'to': '2026-04-24',
            'days': [
              {'date': '2026-04-18', 'minutes': 30},
              {'date': '2026-04-19', 'minutes': 45},
              {'date': '2026-04-20', 'minutes': 60},
              {'date': '2026-04-21', 'minutes': 90},
              {'date': '2026-04-22', 'minutes': 30},
              {'date': '2026-04-23', 'minutes': 120},
              {'date': '2026-04-24', 'minutes': 60},
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
    await _settle(t);

    expect(find.byType(LineChart), findsOneWidget);
    expect(find.textContaining('Du 18/04 au 24/04'), findsOneWidget);
  });

  testWidgets('reports shows "pas de données" on empty payload', (t) async {
    final mock = MockIpcServer();
    late SsIpcClient client;

    await t.runAsync(() async {
      await mock.start((req) {
        if (req['method'] == 'usage.getReport') {
          return {
            'child_id': 'chi-1',
            'from': '2026-04-24',
            'to': '2026-04-24',
            'days': [],
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
    await _settle(t);

    expect(find.text('Pas encore de données'), findsOneWidget);
  });
}
