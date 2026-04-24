import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/app_localizations.dart';
import '../../state/auth_controller.dart';

/// First-run onboarding. Four steps: family name → parent (name + password)
/// → first child → initial policy (daily budget + time window).
///
/// On finish: `family.bootstrap` (which server-side authenticates the
/// connection), mirrors that in [AuthController], then `policy.create`.
class OnboardingWizard extends ConsumerStatefulWidget {
  const OnboardingWizard({super.key});

  @override
  ConsumerState<OnboardingWizard> createState() => _OnboardingWizardState();
}

class _OnboardingWizardState extends ConsumerState<OnboardingWizard> {
  int _step = 0;

  final _familyName = TextEditingController();
  final _parentName = TextEditingController();
  final _password = TextEditingController();
  final _childName = TextEditingController();

  int _budgetMinutes = 120;
  TimeOfDay _windowStart = const TimeOfDay(hour: 16, minute: 0);
  TimeOfDay _windowEnd = const TimeOfDay(hour: 20, minute: 0);
  Set<int> _activeDays = const {1, 2, 3, 4, 5, 6, 7};

  bool _busy = false;
  String? _error;

  @override
  void dispose() {
    _familyName.dispose();
    _parentName.dispose();
    _password.dispose();
    _childName.dispose();
    super.dispose();
  }

  bool get _canAdvance {
    switch (_step) {
      case 0:
        return _familyName.text.trim().isNotEmpty;
      case 1:
        return _parentName.text.trim().isNotEmpty &&
            _password.text.length >= 4;
      case 2:
        return _childName.text.trim().isNotEmpty;
      case 3:
        return _activeDays.isNotEmpty && _budgetMinutes > 0;
      default:
        return false;
    }
  }

  Future<void> _finish() async {
    final l10n = AppLocalizations.of(context);
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final client = await ref.read(ipcClientProvider.future);
      final bootstrap =
          await client.call('family.bootstrap', {
                'family_name': _familyName.text.trim(),
                'parent_display_name': _parentName.text.trim(),
                'parent_password': _password.text,
                'child_display_name': _childName.text.trim(),
                'hostname': _hostname(),
              })
              as Map<Object?, Object?>;
      final childId = bootstrap['child_id'] as String;

      // family.bootstrap authenticates the connection server-side; reflect
      // that in the Flutter auth state so the router releases /dashboard.
      ref.read(authControllerProvider.notifier).markAuthenticated();

      await client.call('policy.create', {
        'child_id': childId,
        'scope': 'child',
        'rules': [
          {'type': 'daily_budget', 'minutes': _budgetMinutes},
          {
            'type': 'time_window',
            'days': (_activeDays.toList()..sort()),
            'start': _fmtTime(_windowStart),
            'end': _fmtTime(_windowEnd),
          },
        ],
      });

      if (!mounted) return;
      context.go('/dashboard');
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = l10n.commonError(e.toString()));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  static String _fmtTime(TimeOfDay t) =>
      '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}:00';

  static String _hostname() {
    try {
      return Platform.localHostname;
    } on Object catch (_) {
      return 'linux-host';
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.onboardingTitle)),
      body: Column(
        children: [
          Expanded(
            child: Stepper(
              type: StepperType.vertical,
              currentStep: _step,
              onStepContinue: (_busy || !_canAdvance)
                  ? null
                  : () {
                      if (_step < 3) {
                        setState(() => _step++);
                      } else {
                        _finish();
                      }
                    },
              onStepCancel: (_step > 0 && !_busy)
                  ? () => setState(() => _step--)
                  : null,
              controlsBuilder: (ctx, details) {
                if (details.stepIndex != details.currentStep) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    children: [
                      FilledButton(
                        onPressed: details.onStepContinue,
                        child: Text(
                          _step == 3
                              ? (_busy ? l10n.commonFinishing : l10n.commonFinish)
                              : l10n.commonNext,
                        ),
                      ),
                      if (_step > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: TextButton(
                            onPressed: details.onStepCancel,
                            child: Text(l10n.commonBack),
                          ),
                        ),
                    ],
                  ),
                );
              },
              steps: [
                _familyStep(l10n),
                _parentStep(l10n),
                _childStep(l10n),
                _policyStep(context, l10n),
              ],
            ),
          ),
          if (_error != null)
            Padding(
              padding: const EdgeInsets.all(16),
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
  }

  Step _familyStep(AppLocalizations l10n) => Step(
    title: Text(l10n.onboardingFamilyStep),
    isActive: _step >= 0,
    state: _step > 0 ? StepState.complete : StepState.indexed,
    content: TextField(
      key: const Key('wizard-family-name'),
      controller: _familyName,
      autofocus: true,
      onChanged: (_) => setState(() {}),
      decoration: InputDecoration(
        labelText: l10n.onboardingFamilyNameLabel,
        border: const OutlineInputBorder(),
      ),
    ),
  );

  Step _parentStep(AppLocalizations l10n) => Step(
    title: Text(l10n.onboardingParentStep),
    isActive: _step >= 1,
    state: _step > 1 ? StepState.complete : StepState.indexed,
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          key: const Key('wizard-parent-name'),
          controller: _parentName,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            labelText: l10n.onboardingParentNameLabel,
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          key: const Key('wizard-parent-password'),
          controller: _password,
          obscureText: true,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            labelText: l10n.onboardingParentPasswordLabel,
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    ),
  );

  Step _childStep(AppLocalizations l10n) => Step(
    title: Text(l10n.onboardingChildStep),
    isActive: _step >= 2,
    state: _step > 2 ? StepState.complete : StepState.indexed,
    content: TextField(
      key: const Key('wizard-child-name'),
      controller: _childName,
      onChanged: (_) => setState(() {}),
      decoration: InputDecoration(
        labelText: l10n.onboardingChildNameLabel,
        border: const OutlineInputBorder(),
      ),
    ),
  );

  Step _policyStep(BuildContext context, AppLocalizations l10n) => Step(
    title: Text(l10n.onboardingPolicyStep),
    isActive: _step >= 3,
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text(l10n.onboardingBudgetLabel),
            const SizedBox(width: 16),
            Expanded(
              child: Slider(
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
        const SizedBox(height: 12),
        Row(
          children: [
            Text(l10n.onboardingWindowLabel),
            const SizedBox(width: 16),
            OutlinedButton(
              onPressed: () async {
                final t = await showTimePicker(
                  context: context,
                  initialTime: _windowStart,
                );
                if (t != null) setState(() => _windowStart = t);
              },
              child: Text(_windowStart.format(context)),
            ),
            const SizedBox(width: 8),
            const Text('→'),
            const SizedBox(width: 8),
            OutlinedButton(
              onPressed: () async {
                final t = await showTimePicker(
                  context: context,
                  initialTime: _windowEnd,
                );
                if (t != null) setState(() => _windowEnd = t);
              },
              child: Text(_windowEnd.format(context)),
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
                selected: _activeDays.contains(idx),
                onSelected: (on) => setState(() {
                  if (on) {
                    _activeDays = {..._activeDays, idx};
                  } else {
                    _activeDays = _activeDays.where((d) => d != idx).toSet();
                  }
                }),
              ),
          ],
        ),
      ],
    ),
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
