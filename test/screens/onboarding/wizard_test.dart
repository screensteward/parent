import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:screensteward_parent/ipc/client.dart';
import 'package:screensteward_parent/screens/onboarding/wizard.dart';
import 'package:screensteward_parent/state/auth_controller.dart';

import '../../support/mock_socket.dart';
import '../../support/test_app.dart';

GoRouter _router() => GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(path: '/onboarding', builder: (_, _) => const OnboardingWizard()),
    GoRoute(
      path: '/dashboard',
      builder: (_, _) =>
          const Scaffold(body: Center(child: Text('DASHBOARD-MARKER'))),
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
  testWidgets('wizard happy path: 4 steps → bootstrap + policy + dashboard', (
    t,
  ) async {
    final mock = MockIpcServer();
    late SsIpcClient client;

    await t.runAsync(() async {
      await mock.start((req) {
        switch (req['method']) {
          case 'family.bootstrap':
            return {
              'family_id': 'fam-1',
              'parent_id': 'par-1',
              'child_id': 'chi-1',
              'device_id': 'dev-1',
            };
          case 'policy.create':
            return {'id': 'pol-1'};
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
        child: testRouterApp(_router()),
      ),
    );
    await t.pumpAndSettle();

    // Step 1 — family name.
    await t.enterText(find.byKey(const Key('wizard-family-name')), 'Dupont');
    await t.pump();
    await t.tap(find.text('Suivant'));
    await t.pumpAndSettle();

    // Step 2 — parent name + password.
    await t.enterText(find.byKey(const Key('wizard-parent-name')), 'Alice');
    await t.enterText(find.byKey(const Key('wizard-parent-password')), 'pass1234');
    await t.pump();
    await t.tap(find.text('Suivant'));
    await t.pumpAndSettle();

    // Step 3 — child name.
    await t.enterText(find.byKey(const Key('wizard-child-name')), 'Léo');
    await t.pump();
    await t.tap(find.text('Suivant'));
    await t.pumpAndSettle();

    // Step 4 — default policy values are already valid (budget 120, all days
    // selected). Hit Terminer.
    await t.tap(find.text('Terminer'));
    await _settleWithRealIo(t);

    expect(find.text('DASHBOARD-MARKER'), findsOneWidget);

    // Verify the two RPC calls shape.
    expect(mock.received, hasLength(2));
    final bootstrap = mock.received[0];
    expect(bootstrap['method'], 'family.bootstrap');
    final bp = bootstrap['params'] as Map;
    expect(bp['family_name'], 'Dupont');
    expect(bp['parent_display_name'], 'Alice');
    expect(bp['parent_password'], 'pass1234');
    expect(bp['child_display_name'], 'Léo');
    expect(bp['hostname'], isA<String>());

    final policy = mock.received[1];
    expect(policy['method'], 'policy.create');
    final pp = policy['params'] as Map;
    expect(pp['child_id'], 'chi-1');
    expect(pp['scope'], 'child');
    final rules = pp['rules'] as List;
    expect(rules, hasLength(2));
    expect(rules[0], {'type': 'daily_budget', 'minutes': 120});
    expect(rules[1], {
      'type': 'time_window',
      'days': [1, 2, 3, 4, 5, 6, 7],
      'start': '16:00:00',
      'end': '20:00:00',
    });

    // Auth state must have flipped after bootstrap.
    expect(container.read(authControllerProvider).authenticated, isTrue);
  });

  testWidgets('wizard: Suivant stays disabled until required fields are typed', (
    t,
  ) async {
    final mock = MockIpcServer();
    late SsIpcClient client;

    await t.runAsync(() async {
      await mock.start((req) => null);
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
        child: testRouterApp(_router()),
      ),
    );
    await t.pumpAndSettle();

    // Step 1 starts with family name empty → Suivant disabled.
    final button = t.widget<FilledButton>(
      find.widgetWithText(FilledButton, 'Suivant'),
    );
    expect(button.onPressed, isNull);
  });
}
