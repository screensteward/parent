import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../ipc/dto.dart';
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

    final status = ref.watch(childStatusProvider);
    final policies = ref.watch(policiesProvider);
    final pending = ref.watch(pendingExtensionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ScreenSteward — Parent'),
        actions: [
          IconButton(
            key: const Key('dashboard-logout'),
            tooltip: 'Se déconnecter',
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: status.when(
          loading: () => const SizedBox(
            height: 80,
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (e, _) => Text('Erreur : $e'),
          data: (s) {
            if (s == null) {
              return const Text('En attente des données du cœur…');
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
                  "Aujourd'hui",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  budget == null
                      ? '$used min utilisées (pas de budget)'
                      : '$used / $budget min utilisées',
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(value: ratio),
                const SizedBox(height: 8),
                Text(
                  s.currentWindowOpen
                      ? 'Créneau ouvert'
                      : 'Hors créneau autorisé',
                ),
                if (s.activeBlocklistDisplay.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text('Bloquées : ${s.activeBlocklistDisplay.join(", ")}'),
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: policies.when(
          loading: () => const SizedBox(
            height: 60,
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (e, _) => Text('Erreur : $e'),
          data: (list) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Règles actives',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  TextButton(
                    key: const Key('dashboard-edit-policy'),
                    onPressed: () =>
                        GoRouter.of(context).push('/policy-editor'),
                    child: const Text('Éditer'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (list.isEmpty)
                const Text('Aucune règle')
              else
                ...list.expand((p) => p.rules.map(_ruleLine)),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _ruleLine(Map<String, dynamic> rule) {
    final type = rule['type'];
    switch (type) {
      case 'daily_budget':
        return ListTile(
          dense: true,
          leading: const Icon(Icons.timelapse),
          title: Text('Budget quotidien : ${rule['minutes']} min'),
        );
      case 'time_window':
        final days = (rule['days'] as List).join(', ');
        return ListTile(
          dense: true,
          leading: const Icon(Icons.schedule),
          title: Text(
            'Créneau ${rule['start']} → ${rule['end']} (jours $days)',
          ),
        );
      case 'app_blocklist':
        final count = (rule['matchers'] as List).length;
        return ListTile(
          dense: true,
          leading: const Icon(Icons.block),
          title: Text('Blocklist — $count application(s)'),
        );
      case 'app_allowlist':
        final count = (rule['matchers'] as List).length;
        return ListTile(
          dense: true,
          leading: const Icon(Icons.check_circle),
          title: Text('Allowlist — $count application(s)'),
        );
      default:
        return ListTile(
          dense: true,
          leading: const Icon(Icons.help),
          title: Text('Règle inconnue : $type'),
        );
    }
  }
}

class _PendingCard extends StatelessWidget {
  final AsyncValue<List<PendingExtension>> pending;
  const _PendingCard({required this.pending});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: pending.when(
          loading: () => const SizedBox(
            height: 60,
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (e, _) => Text('Erreur : $e'),
          data: (list) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Demandes en attente (${list.length})',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  TextButton(
                    key: const Key('dashboard-manage-extensions'),
                    onPressed: () => GoRouter.of(context).push('/extensions'),
                    child: const Text('Gérer'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (list.isEmpty)
                const Text('Aucune demande')
              else
                ...list.take(3).map(
                  (e) => ListTile(
                    dense: true,
                    leading: const Icon(Icons.notifications),
                    title: Text(e.reason ?? '(sans motif)'),
                    subtitle: Text(
                      'Créée ${_relative(e.createdAt)}',
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  static String _relative(DateTime when) {
    final d = DateTime.now().difference(when);
    if (d.inSeconds < 60) return "à l'instant";
    if (d.inMinutes < 60) return 'il y a ${d.inMinutes} min';
    if (d.inHours < 24) return 'il y a ${d.inHours} h';
    return 'il y a ${d.inDays} j';
  }
}
