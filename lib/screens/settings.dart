import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../ipc/dto.dart';
import '../l10n/app_localizations.dart';
import '../state/auth_controller.dart';
import '../state/core_status_controller.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
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
    final l10n = AppLocalizations.of(context);
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
                  l10n.settingsCoreSection,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                IconButton(
                  key: const Key('settings-core-refresh'),
                  tooltip: l10n.commonRefresh,
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
              error: (e, _) => Text(l10n.commonError(e.toString())),
              data: (s) => s == null
                  ? Text(l10n.commonUnavailable)
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
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _line(l10n.settingsCoreFieldVersion, status.version),
        _line(l10n.settingsCoreFieldUptime, _fmtUptime(l10n, status.uptimeSeconds)),
        _line(
          l10n.settingsCoreFieldTpm,
          status.tpmUsed ? l10n.commonYes : l10n.commonNo,
        ),
        _line(
          l10n.settingsCoreFieldDb,
          status.dbOk ? l10n.commonOk : l10n.commonErrorState,
        ),
        if (status.lastEnforcementError != null)
          _line(l10n.settingsCoreFieldLastError, status.lastEnforcementError!),
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

  static String _fmtUptime(AppLocalizations l10n, int s) {
    final d = s ~/ 86400;
    final h = (s % 86400) ~/ 3600;
    final m = (s % 3600) ~/ 60;
    if (d > 0) return l10n.uptimeDhm(d, h, m);
    if (h > 0) return l10n.uptimeHm(h, m);
    return l10n.uptimeM(m);
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

  String? _validate(AppLocalizations l10n) {
    if (_current.text.isEmpty) return l10n.settingsPasswordEmptyCurrent;
    if (_next.text.length < 4) return l10n.settingsPasswordTooShort;
    if (_next.text != _confirm.text) return l10n.settingsPasswordMismatch;
    return null;
  }

  Future<void> _submit() async {
    final l10n = AppLocalizations.of(context);
    final err = _validate(l10n);
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
        _message = l10n.settingsPasswordSuccess;
        _success = true;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _message = l10n.settingsPasswordFailed(e.toString());
        _success = false;
      });
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.settingsPasswordSection,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            TextField(
              key: const Key('settings-current-password'),
              controller: _current,
              obscureText: true,
              decoration: InputDecoration(
                labelText: l10n.settingsPasswordCurrentLabel,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              key: const Key('settings-new-password'),
              controller: _next,
              obscureText: true,
              decoration: InputDecoration(
                labelText: l10n.settingsPasswordNewLabel,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              key: const Key('settings-confirm-password'),
              controller: _confirm,
              obscureText: true,
              decoration: InputDecoration(
                labelText: l10n.settingsPasswordConfirmLabel,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              key: const Key('settings-change-password-submit'),
              onPressed: _busy ? null : _submit,
              child: Text(
                _busy ? l10n.commonSending : l10n.settingsPasswordSubmit,
              ),
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
    final l10n = AppLocalizations.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(child: Text(l10n.settingsLogoutDescription)),
            FilledButton.tonalIcon(
              key: const Key('settings-logout'),
              icon: const Icon(Icons.logout),
              label: Text(l10n.commonLogout),
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
