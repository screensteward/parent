import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_controller.dart';
import 'child_status_controller.dart';
import 'extension_controller.dart';
import 'policy_controller.dart';
import 'usage_report_controller.dart';

/// Listens for server-pushed notifications and invalidates the dependent
/// Riverpod providers so views refresh on policy / usage / extension moves.
///
/// Watch this provider from any long-lived widget (Dashboard) to keep the
/// fan-out alive while the user is inside the authenticated area.
final ipcNotificationFanOutProvider = StreamProvider<void>((ref) async* {
  final client = await ref.watch(ipcClientProvider.future);
  await for (final evt in client.notifications) {
    switch (evt.method) {
      case 'onUsageUpdate':
        ref.invalidate(childStatusProvider);
        ref.invalidate(usageReportProvider);
      case 'onPolicyChanged':
        ref.invalidate(policiesProvider);
        ref.invalidate(childStatusProvider);
      case 'onExtensionRequested':
      case 'onExtensionApproved':
      case 'onExtensionDenied':
        ref.invalidate(pendingExtensionsProvider);
    }
    yield null;
  }
});
