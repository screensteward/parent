import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ipc/dto.dart';
import 'auth_controller.dart';

/// Pending approval requests. `extension.listPending` wraps the payload as
/// `{"pending": [...]}`.
final pendingExtensionsProvider =
    FutureProvider<List<PendingExtension>>((ref) async {
      if (!ref.watch(authControllerProvider).authenticated) return const [];

      final c = await ref.watch(ipcClientProvider.future);
      final raw = await c.call('extension.listPending', const {});
      final list = (Map<String, dynamic>.from(raw as Map)['pending'] as List)
          .cast<Map<Object?, Object?>>();
      return list
          .map((m) => PendingExtension.fromJson(Map<String, dynamic>.from(m)))
          .toList(growable: false);
    });
