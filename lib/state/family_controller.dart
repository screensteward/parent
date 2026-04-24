import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ipc/dto.dart';
import 'auth_controller.dart';

/// Resolves to the current [FamilySnapshot] once authentication succeeds,
/// or `null` while unauthenticated / if the daemon has no family yet.
final familyProvider = FutureProvider<FamilySnapshot?>((ref) async {
  final auth = ref.watch(authControllerProvider);
  if (auth is! AsyncData<AuthState> || !auth.value.authenticated) return null;

  final c = await ref.watch(ipcClientProvider.future);
  final raw = await c.call('family.get', const {});
  if (raw == null) return null;
  final map = Map<String, dynamic>.from(raw as Map);
  if (map['family'] == null && !map.containsKey('family_id')) return null;
  // The daemon may wrap the snapshot in {"family": {…}} or return it flat —
  // accept both for resilience.
  final payload = map['family'] != null
      ? Map<String, dynamic>.from(map['family'] as Map)
      : map;
  return FamilySnapshot.fromJson(payload);
});
