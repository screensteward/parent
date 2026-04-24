import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ipc/client.dart';

const _socketPath = String.fromEnvironment(
  'SS_SOCKET_PATH',
  defaultValue: '/run/screensteward.sock',
);

final ipcClientProvider = FutureProvider<SsIpcClient>((ref) async {
  final c = await SsIpcClient.connect(_socketPath);
  ref.onDispose(c.close);
  return c;
});

class AuthState {
  final bool authenticated;
  const AuthState({required this.authenticated});
}

class AuthController extends AsyncNotifier<AuthState> {
  @override
  Future<AuthState> build() async => const AuthState(authenticated: false);

  Future<void> login(String password) async {
    state = const AsyncLoading();
    try {
      final c = await ref.read(ipcClientProvider.future);
      await c.call('auth.login', {'password': password});
      state = const AsyncData(AuthState(authenticated: true));
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }

  Future<void> logout() async {
    final c = await ref.read(ipcClientProvider.future);
    await c.call('auth.logout', const {});
    state = const AsyncData(AuthState(authenticated: false));
  }
}

final authControllerProvider =
    AsyncNotifierProvider<AuthController, AuthState>(AuthController.new);
