import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../ipc/dto.dart';
import '../state/auth_controller.dart';
import '../state/core_status_controller.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _CoreStatusCard(),
          SizedBox(height: 12),
          _ChangePasswordCard(),
          SizedBox(height: 12),
          _LogoutCard(),
        ],
      ),
    );
  }
}

class _CoreStatusCard extends ConsumerWidget {
  const _CoreStatusCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(coreStatusProvider);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Statut du cœur',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                IconButton(
                  key: const Key('settings-core-refresh'),
                  tooltip: 'Rafraîchir',
                  icon: const Icon(Icons.refresh),
                  onPressed: () => ref.invalidate(coreStatusProvider),
                ),
              ],
            ),
            const SizedBox(height: 8),
            status.when(
              loading: () => const SizedBox(
                height: 40,
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (e, _) => Text('Erreur : $e'),
              data: (s) => s == null
                  ? const Text('Non disponible')
                  : _CoreStatusBody(status: s),
            ),
          ],
        ),
      ),
    );
  }
}

class _CoreStatusBody extends StatelessWidget {
  final CoreStatus status;
  const _CoreStatusBody({required this.status});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _line('Version', status.version),
        _line('Uptime', _fmtUptime(status.uptimeSeconds)),
        _line('TPM utilisé', status.tpmUsed ? 'oui' : 'non'),
        _line('Base de données', status.dbOk ? 'OK' : 'erreur'),
        if (status.lastEnforcementError != null)
          _line('Dernière erreur', status.lastEnforcementError!),
      ],
    );
  }

  static Widget _line(String key, String value) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Row(
      children: [
        SizedBox(width: 160, child: Text(key)),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontFeatures: [FontFeature.tabularFigures()]),
          ),
        ),
      ],
    ),
  );

  static String _fmtUptime(int s) {
    final d = s ~/ 86400;
    final h = (s % 86400) ~/ 3600;
    final m = (s % 3600) ~/ 60;
    if (d > 0) return '${d}j ${h}h ${m}min';
    if (h > 0) return '${h}h ${m}min';
    return '${m}min';
  }
}

class _ChangePasswordCard extends ConsumerStatefulWidget {
  const _ChangePasswordCard();

  @override
  ConsumerState<_ChangePasswordCard> createState() =>
      _ChangePasswordCardState();
}

class _ChangePasswordCardState extends ConsumerState<_ChangePasswordCard> {
  final _current = TextEditingController();
  final _next = TextEditingController();
  final _confirm = TextEditingController();
  bool _busy = false;
  String? _message;
  bool _success = false;

  @override
  void dispose() {
    _current.dispose();
    _next.dispose();
    _confirm.dispose();
    super.dispose();
  }

  String? _validate() {
    if (_current.text.isEmpty) return 'Saisis le mot de passe actuel';
    if (_next.text.length < 4) return 'Le nouveau mot de passe doit faire ≥ 4 caractères';
    if (_next.text != _confirm.text) return 'La confirmation ne correspond pas';
    return null;
  }

  Future<void> _submit() async {
    final err = _validate();
    if (err != null) {
      setState(() {
        _message = err;
        _success = false;
      });
      return;
    }
    setState(() {
      _busy = true;
      _message = null;
      _success = false;
    });
    try {
      final c = await ref.read(ipcClientProvider.future);
      await c.call('auth.changePassword', {
        'old': _current.text,
        'new': _next.text,
      });
      if (!mounted) return;
      _current.clear();
      _next.clear();
      _confirm.clear();
      setState(() {
        _message = 'Mot de passe mis à jour';
        _success = true;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _message = 'Échec : $e';
        _success = false;
      });
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Changer le mot de passe',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            TextField(
              key: const Key('settings-current-password'),
              controller: _current,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Mot de passe actuel',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              key: const Key('settings-new-password'),
              controller: _next,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Nouveau mot de passe',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              key: const Key('settings-confirm-password'),
              controller: _confirm,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirmation',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              key: const Key('settings-change-password-submit'),
              onPressed: _busy ? null : _submit,
              child: Text(_busy ? 'Envoi…' : 'Mettre à jour'),
            ),
            if (_message != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  _message!,
                  style: TextStyle(
                    color: _success
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _LogoutCard extends ConsumerWidget {
  const _LogoutCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Expanded(child: Text('Terminer la session parent.')),
            FilledButton.tonalIcon(
              key: const Key('settings-logout'),
              icon: const Icon(Icons.logout),
              label: const Text('Se déconnecter'),
              onPressed: () async {
                await ref.read(authControllerProvider.notifier).logout();
                if (context.mounted) context.go('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
