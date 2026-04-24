import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../ipc/dto.dart';
import '../l10n/app_localizations.dart';
import '../state/auth_controller.dart';
import '../state/policy_controller.dart';

/// Minimal policy editor for Phase 1: covers `daily_budget` + `time_window`.
/// The blocklist / allowlist matcher form is deferred to a follow-up task.
///
/// Loads the first policy returned by `policy.list` (single-child invariant);
/// if there is none, creates a fresh one on save.
class PolicyEditorScreen extends ConsumerStatefulWidget {
  const PolicyEditorScreen({super.key});

  @override
  ConsumerState<PolicyEditorScreen> createState() =>
      _PolicyEditorScreenState();
}

class _PolicyEditorScreenState extends ConsumerState<PolicyEditorScreen> {
  int _budgetMinutes = 120;
  TimeOfDay _start = const TimeOfDay(hour: 16, minute: 0);
  TimeOfDay _end = const TimeOfDay(hour: 20, minute: 0);
  Set<int> _days = const {1, 2, 3, 4, 5, 6, 7};

  bool _loaded = false;
  String? _existingPolicyId;
  String? _childId;

  bool _saving = false;
  String? _error;

  void _hydrateFrom(PolicyView p) {
    _existingPolicyId = p.id;
    _childId = p.childId;
    for (final rule in p.rules) {
      switch (rule['type']) {
        case 'daily_budget':
          _budgetMinutes = (rule['minutes'] as num).toInt();
        case 'time_window':
          _days = (rule['days'] as List).cast<num>().map((n) => n.toInt()).toSet();
          _start = _parseHm(rule['start'] as String);
          _end = _parseHm(rule['end'] as String);
      }
    }
  }

  static TimeOfDay _parseHm(String s) {
    final parts = s.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  static String _fmtTime(TimeOfDay t) =>
      '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}:00';

  Future<void> _save() async {
    final l10n = AppLocalizations.of(context);
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      final c = await ref.read(ipcClientProvider.future);
      final rules = [
        {'type': 'daily_budget', 'minutes': _budgetMinutes},
        {
          'type': 'time_window',
          'days': (_days.toList()..sort()),
          'start': _fmtTime(_start),
          'end': _fmtTime(_end),
        },
      ];
      if (_existingPolicyId != null) {
        await c.call('policy.update', {'id': _existingPolicyId, 'rules': rules});
      } else {
        // No policy yet: need a child_id. Best-effort via the first policy
        // we could see, otherwise punt to the caller.
        if (_childId == null) {
          throw StateError(
            'Cannot create a policy: no child_id available. Bootstrap the '
            'family first (onboarding wizard).',
          );
        }
        await c.call('policy.create', {
          'child_id': _childId,
          'scope': 'child',
          'rules': rules,
        });
      }
      ref.invalidate(policiesProvider);
      if (!mounted) return;
      context.pop();
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = l10n.commonError(e.toString()));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final policies = ref.watch(policiesProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.policyEditorTitle)),
      body: policies.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(l10n.commonError(e.toString()))),
        data: (list) {
          if (!_loaded) {
            if (list.isNotEmpty) _hydrateFrom(list.first);
            _loaded = true;
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _sectionTitle(context, l10n.policyEditorBudgetSection),
                Row(
                  children: [
                    Expanded(
                      child: Slider(
                        key: const Key('policy-budget-slider'),
                        min: 30,
                        max: 360,
                        divisions: 11,
                        value: _budgetMinutes.toDouble(),
                        label: l10n.extensionsDurationValue(_budgetMinutes),
                        onChanged: (v) =>
                            setState(() => _budgetMinutes = v.round()),
                      ),
                    ),
                    SizedBox(
                      width: 72,
                      child: Text(l10n.extensionsDurationValue(_budgetMinutes)),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _sectionTitle(context, l10n.policyEditorWindowSection),
                Row(
                  children: [
                    OutlinedButton(
                      key: const Key('policy-start-button'),
                      onPressed: () async {
                        final t = await showTimePicker(
                          context: context,
                          initialTime: _start,
                        );
                        if (t != null) setState(() => _start = t);
                      },
                      child: Text(_start.format(context)),
                    ),
                    const SizedBox(width: 8),
                    const Text('→'),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      key: const Key('policy-end-button'),
                      onPressed: () async {
                        final t = await showTimePicker(
                          context: context,
                          initialTime: _end,
                        );
                        if (t != null) setState(() => _end = t);
                      },
                      child: Text(_end.format(context)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: [
                    for (final (idx, label) in _weekdays(l10n))
                      FilterChip(
                        label: Text(label),
                        selected: _days.contains(idx),
                        onSelected: (on) => setState(() {
                          _days = on
                              ? {..._days, idx}
                              : _days.where((d) => d != idx).toSet();
                        }),
                      ),
                  ],
                ),
                const SizedBox(height: 24),
                FilledButton(
                  key: const Key('policy-save-button'),
                  onPressed: _saving || _days.isEmpty ? null : _save,
                  child: Text(_saving ? l10n.commonSaving : l10n.commonSave),
                ),
                if (_error != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      _error!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(text, style: Theme.of(context).textTheme.titleMedium),
  );

  static List<(int, String)> _weekdays(AppLocalizations l10n) => [
    (1, l10n.dayMonShort),
    (2, l10n.dayTueShort),
    (3, l10n.dayWedShort),
    (4, l10n.dayThuShort),
    (5, l10n.dayFriShort),
    (6, l10n.daySatShort),
    (7, l10n.daySunShort),
  ];
}
