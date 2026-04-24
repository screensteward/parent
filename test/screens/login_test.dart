import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:screensteward_parent/ipc/client.dart';
import 'package:screensteward_parent/screens/login.dart';
import 'package:screensteward_parent/state/auth_controller.dart';

import '../support/mock_socket.dart';

GoRouter _router() => GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (_, _) => const LoginScreen()),
    GoRoute(
      path: '/dashboard',
      builder: (_, _) =>
          const Scaffold(body: Center(child: Text('DASHBOARD-MARKER'))),
    ),
  ],
);

Future<void> _settleWithRealIo(WidgetTester t) async {
  await t.runAsync(() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
  });
  await t.pump();
  await t.pump();
}

void main() {
  testWidgets('login: happy path sends auth.login and navigates to /dashboard', (
    t,
  ) async {
    final mock = MockIpcServer();
    late SsIpcClient client;

    await t.runAsync(() async {
      await mock.start((req) {
        if (req['method'] == 'auth.login') {
          expect((req['params'] as Map)['password'], 's3cret');
          return {'parent_id': 'p-1'};
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

    await t.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(routerConfig: _router()),
      ),
    );
    await t.pumpAndSettle();

    await t.enterText(find.byType(TextField), 's3cret');
    await t.tap(find.text('Se connecter'));
    await _settleWithRealIo(t);

    expect(find.text('DASHBOARD-MARKER'), findsOneWidget);
    expect(mock.received, hasLength(1));
    expect(container.read(authControllerProvider).authenticated, isTrue);
  });

  testWidgets('login: wrong password shows inline error, no navigation', (
    t,
  ) async {
    final mock = MockIpcServer();
    late SsIpcClient client;

    await t.runAsync(() async {
      await mock.start((req) => null); // all methods → RPC error
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

    await t.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(routerConfig: _router()),
      ),
    );
    await t.pumpAndSettle();

    await t.enterText(find.byType(TextField), 'wrong');
    await t.tap(find.text('Se connecter'));
    await _settleWithRealIo(t);

    expect(find.textContaining('Échec de connexion'), findsOneWidget);
    expect(find.text('DASHBOARD-MARKER'), findsNothing);
    expect(container.read(authControllerProvider).authenticated, isFalse);
  });
}
