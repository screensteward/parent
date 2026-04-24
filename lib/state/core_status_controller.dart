import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ipc/dto.dart';
import 'auth_controller.dart';

/// Current daemon status. Auth-gated.
final coreStatusProvider = FutureProvider<CoreStatus?>((ref) async {
  if (!ref.watch(authControllerProvider).authenticated) return null;
  final c = await ref.watch(ipcClientProvider.future);
  final raw = await c.call('system.getCoreStatus', const {});
  return CoreStatus.fromJson(Map<String, dynamic>.from(raw as Map));
});
