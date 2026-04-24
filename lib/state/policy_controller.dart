import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ipc/dto.dart';
import 'auth_controller.dart';

/// Policies for the (single) child of Phase 1. policy.list defaults to the
/// unique child when child_id is omitted, and wraps its payload as
/// `{"policies": [...]}`.
final policiesProvider = FutureProvider<List<PolicyView>>((ref) async {
  if (!ref.watch(authControllerProvider).authenticated) return const [];

  final c = await ref.watch(ipcClientProvider.future);
  final raw = await c.call('policy.list', const {});
  final list = (Map<String, dynamic>.from(raw as Map)['policies'] as List)
      .cast<Map<Object?, Object?>>();
  return list
      .map((m) => PolicyView.fromJson(Map<String, dynamic>.from(m)))
      .toList(growable: false);
});
