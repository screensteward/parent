import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ipc/dto.dart';
import 'auth_controller.dart';

/// Last-7-days usage series (default range of `usage.getReport`).
/// Auth-gated: returns an empty report while unauthenticated.
final usageReportProvider = FutureProvider<UsageReport?>((ref) async {
  if (!ref.watch(authControllerProvider).authenticated) return null;
  final c = await ref.watch(ipcClientProvider.future);
  final raw = await c.call('usage.getReport', const {});
  return UsageReport.fromJson(Map<String, dynamic>.from(raw as Map));
});
