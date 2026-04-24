import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:screensteward_parent/ipc/client.dart';
import 'package:screensteward_parent/screens/settings.dart';
import 'package:screensteward_parent/state/auth_controller.dart';

import '../support/mock_socket.dart';

GoRouter _router() => GoRouter(
  initialLocation: '/settings',
  routes: [
    GoRoute(path: '/settings', builder: (_, _) => const SettingsScreen()),
    GoRoute(
      path: '/login',
      builder: (_, _) =>
          const Scaffold(body: Center(child: Text('LOGIN-MARKER'))),
    ),
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
  testWidgets('core status card shows daemon info', (t) async {
    final mock = MockIpcServer();
    late SsIpcClient client;

    await t.runAsync(() async {
      await mock.start((req) {
        if (req['method'] == 'system.getCoreStatus') {
          return {
            'version': '0.1.0',
            'uptime_seconds': 3725,
            'tpm_used': false,
            'db_ok': true,
            'last_enforcement_error': null,
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

    expect(find.text('0.1.0'), findsOneWidget);
    expect(find.text('1h 2min'), findsOneWidget);
  });

  testWidgets('change password: happy path sends auth.changePassword', (
    t,
  ) async {
    final mock = MockIpcServer();
    late SsIpcClient client;

    await t.runAsync(() async {
      await mock.start((req) {
        switch (req['method']) {
          case 'system.getCoreStatus':
            return {
              'version': '0.1.0',
              'uptime_seconds': 0,
              'tpm_used': false,
              'db_ok': true,
              'last_enforcement_error': null,
            };
          case 'auth.changePassword':
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
    await _settle(t);

    await t.enterText(find.byKey(const Key('settings-current-password')), 'old-pw');
    await t.enterText(find.byKey(const Key('settings-new-password')), 'new-password');
    await t.enterText(
      find.byKey(const Key('settings-confirm-password')),
      'new-password',
    );
    await t.tap(find.byKey(const Key('settings-change-password-submit')));
    await _settle(t);

    final call = mock.received.firstWhere(
      (r) => r['method'] == 'auth.changePassword',
    );
    expect((call['params'] as Map)['old'], 'old-pw');
    expect((call['params'] as Map)['new'], 'new-password');
    expect(find.text('Mot de passe mis à jour'), findsOneWidget);
  });

  testWidgets('change password: mismatched confirmation shows inline error', (
    t,
  ) async {
    final mock = MockIpcServer();
    late SsIpcClient client;

    await t.runAsync(() async {
      await mock.start((req) {
        if (req['method'] == 'system.getCoreStatus') {
          return {
            'version': '0.1.0',
            'uptime_seconds': 0,
            'tpm_used': false,
            'db_ok': true,
            'last_enforcement_error': null,
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

    await t.enterText(find.byKey(const Key('settings-current-password')), 'old');
    await t.enterText(find.byKey(const Key('settings-new-password')), 'newpass');
    await t.enterText(
      find.byKey(const Key('settings-confirm-password')),
      'different',
    );
    await t.tap(find.byKey(const Key('settings-change-password-submit')));
    await t.pump();

    expect(
      find.textContaining('confirmation ne correspond pas'),
      findsOneWidget,
    );
    expect(
      mock.received.where((r) => r['method'] == 'auth.changePassword'),
      isEmpty,
    );
  });

  testWidgets('logout button navigates to /login', (t) async {
    final mock = MockIpcServer();
    late SsIpcClient client;

    await t.runAsync(() async {
      await mock.start((req) {
        switch (req['method']) {
          case 'system.getCoreStatus':
            return {
              'version': '0.1.0',
              'uptime_seconds': 0,
              'tpm_used': false,
              'db_ok': true,
              'last_enforcement_error': null,
            };
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
    await _settle(t);

    await t.scrollUntilVisible(
      find.byKey(const Key('settings-logout')),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await t.tap(find.byKey(const Key('settings-logout')));
    await _settle(t);

    expect(find.text('LOGIN-MARKER'), findsOneWidget);
    expect(container.read(authControllerProvider).authenticated, isFalse);
  });
}
