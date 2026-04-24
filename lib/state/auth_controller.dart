import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ipc/client.dart';

const _socketPath = String.fromEnvironment(
  'SS_SOCKET_PATH',
  defaultValue: '/run/screensteward.sock',
);

final ipcClientProvider = FutureProvider<SsIpcClient>((ref) async {
  final c = await SsIpcClient.connect(_socketPath);
  // Parent watches everything that can move under its feet. subscribe()
  // is a notification (no response), fine to run pre-auth.
  await c.subscribe(const [
    'usageUpdate',
    'policyChanged',
    'extensionRequested',
    'extensionApproved',
    'extensionDenied',
    'enforcementAction',
  ]);
  ref.onDispose(c.close);
  return c;
});

class AuthState {
  final bool authenticated;
  const AuthState({required this.authenticated});
}

/// Kept synchronous (plain [Notifier]) so the initial `build` value is
/// available immediately; an `AsyncNotifier` would race with an explicit
/// state flip right after `family.bootstrap` (build's future would resolve
/// after `markAuthenticated` and clobber it back to unauthenticated).
class AuthController extends Notifier<AuthState> {
  @override
  AuthState build() => const AuthState(authenticated: false);

  Future<void> login(String password) async {
    final c = await ref.read(ipcClientProvider.future);
    await c.call('auth.login', {'password': password});
    state = const AuthState(authenticated: true);
  }

  Future<void> logout() async {
    final c = await ref.read(ipcClientProvider.future);
    await c.call('auth.logout', const {});
    state = const AuthState(authenticated: false);
  }

  /// family.bootstrap authenticates the connection server-side without ever
  /// going through auth.login, so this mirrors that flip on the client.
  void markAuthenticated() {
    state = const AuthState(authenticated: true);
  }
}

final authControllerProvider = NotifierProvider<AuthController, AuthState>(
  AuthController.new,
);
