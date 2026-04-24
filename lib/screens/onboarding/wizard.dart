import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
      setState(() => _error = 'Erreur : $e');
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
    return Scaffold(
      appBar: AppBar(title: const Text('Premier lancement')),
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
                // Stepper calls this for every step; only the active one
                // should expose a tap target.
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
                              ? (_busy ? 'En cours…' : 'Terminer')
                              : 'Suivant',
                        ),
                      ),
                      if (_step > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: TextButton(
                            onPressed: details.onStepCancel,
                            child: const Text('Retour'),
                          ),
                        ),
                    ],
                  ),
                );
              },
              steps: [
                _familyStep(),
                _parentStep(),
                _childStep(),
                _policyStep(context),
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

  Step _familyStep() => Step(
    title: const Text('Famille'),
    isActive: _step >= 0,
    state: _step > 0 ? StepState.complete : StepState.indexed,
    content: TextField(
      key: const Key('wizard-family-name'),
      controller: _familyName,
      autofocus: true,
      onChanged: (_) => setState(() {}),
      decoration: const InputDecoration(
        labelText: 'Nom de la famille',
        border: OutlineInputBorder(),
      ),
    ),
  );

  Step _parentStep() => Step(
    title: const Text('Parent'),
    isActive: _step >= 1,
    state: _step > 1 ? StepState.complete : StepState.indexed,
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          key: const Key('wizard-parent-name'),
          controller: _parentName,
          onChanged: (_) => setState(() {}),
          decoration: const InputDecoration(
            labelText: 'Votre prénom',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          key: const Key('wizard-parent-password'),
          controller: _password,
          obscureText: true,
          onChanged: (_) => setState(() {}),
          decoration: const InputDecoration(
            labelText: 'Mot de passe parent (≥ 4 caractères)',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    ),
  );

  Step _childStep() => Step(
    title: const Text('Enfant'),
    isActive: _step >= 2,
    state: _step > 2 ? StepState.complete : StepState.indexed,
    content: TextField(
      key: const Key('wizard-child-name'),
      controller: _childName,
      onChanged: (_) => setState(() {}),
      decoration: const InputDecoration(
        labelText: "Prénom de l'enfant",
        border: OutlineInputBorder(),
      ),
    ),
  );

  Step _policyStep(BuildContext context) => Step(
    title: const Text('Règles initiales'),
    isActive: _step >= 3,
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Text('Budget quotidien :'),
            const SizedBox(width: 16),
            Expanded(
              child: Slider(
                min: 30,
                max: 360,
                divisions: 11,
                value: _budgetMinutes.toDouble(),
                label: '$_budgetMinutes min',
                onChanged: (v) =>
                    setState(() => _budgetMinutes = v.round()),
              ),
            ),
            SizedBox(width: 64, child: Text('$_budgetMinutes min')),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text('Créneau :'),
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
            for (final (idx, label) in const [
              (1, 'Lun'),
              (2, 'Mar'),
              (3, 'Mer'),
              (4, 'Jeu'),
              (5, 'Ven'),
              (6, 'Sam'),
              (7, 'Dim'),
            ])
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
}
