import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ipc/dto.dart';
import 'auth_controller.dart';

/// Active policies for a given child. Empty list while unauthenticated.
final policiesProvider = FutureProvider.family<List<PolicyView>, String>((
  ref,
  childId,
) async {
  if (!ref.watch(authControllerProvider).authenticated) return const [];

  final c = await ref.watch(ipcClientProvider.future);
  final raw = await c.call('policy.list', {'child_id': childId});
  final list = (raw as List).cast<Map<Object?, Object?>>();
  return list
      .map((m) => PolicyView.fromJson(Map<String, dynamic>.from(m)))
      .toList(growable: false);
});
