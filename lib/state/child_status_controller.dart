import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ipc/dto.dart';
import 'auth_controller.dart';

/// Parent view of [ChildStatus] for the single-child invariant of Phase 1.
/// Auth-gated: returns `null` until the parent is authenticated.
final childStatusProvider = FutureProvider<ChildStatus?>((ref) async {
  if (!ref.watch(authControllerProvider).authenticated) return null;
  final c = await ref.watch(ipcClientProvider.future);
  final raw = await c.call('child.getStatus', const {});
  final map = Map<String, dynamic>.from(raw as Map);
  // Daemon returns {"onboarding_required": true} when no family exists;
  // don't try to parse that as a ChildStatus.
  if (map['onboarding_required'] == true) return null;
  return ChildStatus.fromJson(map);
});
