import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_controller.dart';

/// Pending extension requests. Raw maps for now — a typed DTO will land in
/// Phase 1 once the server-side shape stabilises (Task 26).
final pendingExtensionsProvider = FutureProvider<List<Map<String, dynamic>>>((
  ref,
) async {
  final auth = ref.watch(authControllerProvider);
  if (auth is! AsyncData<AuthState> || !auth.value.authenticated) return const [];

  final c = await ref.watch(ipcClientProvider.future);
  final raw = await c.call('extension.listPending', const {});
  final list = (raw as List).cast<Map<Object?, Object?>>();
  return list.map((m) => Map<String, dynamic>.from(m)).toList(growable: false);
});
