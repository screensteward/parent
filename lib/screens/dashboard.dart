import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../ipc/dto.dart';
import '../l10n/app_localizations.dart';
import '../state/auth_controller.dart';
import '../state/child_status_controller.dart';
import '../state/extension_controller.dart';
import '../state/ipc_notification_fan_out.dart';
import '../state/policy_controller.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Keep the notification fan-out alive while the dashboard is on screen.
    ref.watch(ipcNotificationFanOutProvider);

    final l10n = AppLocalizations.of(context);
    final status = ref.watch(childStatusProvider);
    final policies = ref.watch(policiesProvider);
    final pending = ref.watch(pendingExtensionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.dashboardTitle),
        actions: [
          IconButton(
            key: const Key('dashboard-reports'),
            tooltip: l10n.dashboardReportsTooltip,
            icon: const Icon(Icons.bar_chart),
            onPressed: () => GoRouter.of(context).push('/reports'),
          ),
          IconButton(
            key: const Key('dashboard-settings'),
            tooltip: l10n.dashboardSettingsTooltip,
            icon: const Icon(Icons.settings),
            onPressed: () => GoRouter.of(context).push('/settings'),
          ),
          IconButton(
            key: const Key('dashboard-logout'),
            tooltip: l10n.commonLogout,
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await ref.read(authControllerProvider.notifier).logout();
              if (context.mounted) context.go('/login');
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _UsageCard(status: status),
          const SizedBox(height: 12),
          _PoliciesCard(policies: policies),
          const SizedBox(height: 12),
          _PendingCard(pending: pending),
        ],
      ),
    );
  }
}

class _UsageCard extends StatelessWidget {
  final AsyncValue<ChildStatus?> status;
  const _UsageCard({required this.status});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: status.when(
          loading: () => const SizedBox(
            height: 80,
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (e, _) => Text(l10n.commonError(e.toString())),
          data: (s) {
            if (s == null) {
              return Text(l10n.dashboardCorePending);
            }
            final budget = s.todayBudgetMinutes;
            final used = s.todayMinutesUsed;
            final ratio = (budget == null || budget == 0)
                ? 0.0
                : (used / budget).clamp(0.0, 1.0);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.dashboardToday,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  budget == null
                      ? l10n.dashboardUsageNoBudget(used)
                      : l10n.dashboardUsageWithBudget(used, budget),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(value: ratio),
                const SizedBox(height: 8),
                Text(
                  s.currentWindowOpen
                      ? l10n.dashboardWindowOpen
                      : l10n.dashboardWindowClosed,
                ),
                if (s.activeBlocklistDisplay.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    l10n.dashboardBlockedList(
                      s.activeBlocklistDisplay.join(', '),
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}

class _PoliciesCard extends StatelessWidget {
  final AsyncValue<List<PolicyView>> policies;
  const _PoliciesCard({required this.policies});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: policies.when(
          loading: () => const SizedBox(
            height: 60,
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (e, _) => Text(l10n.commonError(e.toString())),
          data: (list) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    l10n.dashboardPoliciesTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  TextButton(
                    key: const Key('dashboard-edit-policy'),
                    onPressed: () =>
                        GoRouter.of(context).push('/policy-editor'),
                    child: Text(l10n.dashboardPoliciesEdit),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (list.isEmpty)
                Text(l10n.dashboardPoliciesEmpty)
              else
                ...list.expand((p) => p.rules.map((r) => _ruleLine(l10n, r))),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _ruleLine(AppLocalizations l10n, Map<String, dynamic> rule) {
    final type = rule['type'];
    switch (type) {
      case 'daily_budget':
        return ListTile(
          dense: true,
          leading: const Icon(Icons.timelapse),
          title: Text(
            l10n.ruleDailyBudgetSummary((rule['minutes'] as num).toInt()),
          ),
        );
      case 'time_window':
        final days = (rule['days'] as List).join(', ');
        return ListTile(
          dense: true,
          leading: const Icon(Icons.schedule),
          title: Text(
            l10n.ruleTimeWindowSummary(
              rule['start'] as String,
              rule['end'] as String,
              days,
            ),
          ),
        );
      case 'app_blocklist':
        final count = (rule['matchers'] as List).length;
        return ListTile(
          dense: true,
          leading: const Icon(Icons.block),
          title: Text(l10n.ruleBlocklistSummary(count)),
        );
      case 'app_allowlist':
        final count = (rule['matchers'] as List).length;
        return ListTile(
          dense: true,
          leading: const Icon(Icons.check_circle),
          title: Text(l10n.ruleAllowlistSummary(count)),
        );
      default:
        return ListTile(
          dense: true,
          leading: const Icon(Icons.help),
          title: Text(l10n.ruleUnknownSummary(type.toString())),
        );
    }
  }
}

class _PendingCard extends StatelessWidget {
  final AsyncValue<List<PendingExtension>> pending;
  const _PendingCard({required this.pending});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: pending.when(
          loading: () => const SizedBox(
            height: 60,
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (e, _) => Text(l10n.commonError(e.toString())),
          data: (list) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    l10n.dashboardPendingTitle(list.length),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  TextButton(
                    key: const Key('dashboard-manage-extensions'),
                    onPressed: () => GoRouter.of(context).push('/extensions'),
                    child: Text(l10n.dashboardPendingManage),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (list.isEmpty)
                Text(l10n.dashboardPendingEmpty)
              else
                ...list.take(3).map(
                  (e) => ListTile(
                    dense: true,
                    leading: const Icon(Icons.notifications),
                    title: Text(e.reason ?? l10n.commonNoReason),
                    subtitle: Text(
                      l10n.dashboardPendingCreated(_relative(l10n, e.createdAt)),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  static String _relative(AppLocalizations l10n, DateTime when) {
    final d = DateTime.now().difference(when);
    if (d.inSeconds < 60) return l10n.timeJustNow;
    if (d.inMinutes < 60) return l10n.timeMinutesAgo(d.inMinutes);
    if (d.inHours < 24) return l10n.timeHoursAgo(d.inHours);
    return l10n.timeDaysAgo(d.inDays);
  }
}
