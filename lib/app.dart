import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'screens/dashboard.dart';
import 'screens/extensions.dart';
import 'screens/login.dart';
import 'screens/onboarding/wizard.dart';
import 'screens/policy_editor.dart';
import 'state/auth_controller.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/boot',
    refreshListenable: _AuthRefresh(ref),
    redirect: (ctx, state) async {
      // /boot is the only route that probes the daemon to decide the
      // initial destination. Subsequent navigations trust the auth state.
      if (state.matchedLocation == '/boot') {
        final client = await ref.read(ipcClientProvider.future);
        final raw = await client.call('child.getStatus', const {});
        final map = Map<String, dynamic>.from(raw as Map);
        if (map['onboarding_required'] == true) return '/onboarding';
        return _isAuthed(ref) ? '/dashboard' : '/login';
      }
      // Guard: /dashboard requires auth, /login/onboarding forbid it.
      final authed = _isAuthed(ref);
      if (state.matchedLocation == '/dashboard' && !authed) return '/login';
      if (authed &&
          (state.matchedLocation == '/login' ||
              state.matchedLocation == '/onboarding')) {
        return '/dashboard';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/boot',
        builder: (_, _) =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (_, _) => const OnboardingWizard(),
      ),
      GoRoute(path: '/login', builder: (_, _) => const LoginScreen()),
      GoRoute(path: '/dashboard', builder: (_, _) => const DashboardScreen()),
      GoRoute(
        path: '/policy-editor',
        builder: (_, _) => const PolicyEditorScreen(),
      ),
      GoRoute(
        path: '/extensions',
        builder: (_, _) => const ExtensionsScreen(),
      ),
    ],
  );
});

bool _isAuthed(Ref ref) => ref.read(authControllerProvider).authenticated;

/// Bridges the Riverpod auth state to go_router's Listenable-based refresh so
/// the redirect re-runs whenever the user logs in/out or bootstraps.
class _AuthRefresh extends ChangeNotifier {
  _AuthRefresh(Ref ref) {
    ref.listen<AuthState>(authControllerProvider, (_, _) {
      notifyListeners();
    });
  }
}

class ScreenStewardParentApp extends ConsumerWidget {
  const ScreenStewardParentApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'ScreenSteward — Parent',
      theme: ThemeData(useMaterial3: true),
      routerConfig: router,
    );
  }
}
