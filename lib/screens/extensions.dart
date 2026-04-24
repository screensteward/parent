import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ipc/dto.dart';
import '../l10n/app_localizations.dart';
import '../state/auth_controller.dart';
import '../state/extension_controller.dart';

class ExtensionsScreen extends ConsumerWidget {
  const ExtensionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final pending = ref.watch(pendingExtensionsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.extensionsTitle)),
      body: pending.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(l10n.commonError(e.toString()))),
        data: (list) {
          if (list.isEmpty) {
            return Center(child: Text(l10n.extensionsEmpty));
          }
          return ListView.separated(
            itemCount: list.length,
            separatorBuilder: (_, _) => const Divider(height: 0),
            itemBuilder: (ctx, i) => _PendingTile(entry: list[i]),
          );
        },
      ),
    );
  }
}

class _PendingTile extends ConsumerStatefulWidget {
  final PendingExtension entry;
  const _PendingTile({required this.entry});

  @override
  ConsumerState<_PendingTile> createState() => _PendingTileState();
}

class _PendingTileState extends ConsumerState<_PendingTile> {
  bool _busy = false;

  Future<void> _approve() async {
    final l10n = AppLocalizations.of(context);
    final duration = await _pickDuration(context);
    if (duration == null || !mounted) return;

    setState(() => _busy = true);
    try {
      final c = await ref.read(ipcClientProvider.future);
      await c.call('extension.approve', {
        'ticket_id': widget.entry.id,
        'duration_minutes': duration,
      });
      ref.invalidate(pendingExtensionsProvider);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.extensionsApproveFailed(e.toString()))),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _deny() async {
    final l10n = AppLocalizations.of(context);
    setState(() => _busy = true);
    try {
      final c = await ref.read(ipcClientProvider.future);
      await c.call('extension.deny', {'ticket_id': widget.entry.id});
      ref.invalidate(pendingExtensionsProvider);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.extensionsDenyFailed(e.toString()))),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final e = widget.entry;
    return ListTile(
      title: Text(e.reason ?? l10n.commonNoReason),
      subtitle: Text(
        l10n.extensionsCreatedAt(
          e.createdAt.toLocal().toString().split('.').first,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            key: Key('ext-deny-${e.id}'),
            onPressed: _busy ? null : _deny,
            child: Text(l10n.extensionsDeny),
          ),
          const SizedBox(width: 4),
          FilledButton(
            key: Key('ext-approve-${e.id}'),
            onPressed: _busy ? null : _approve,
            child: Text(l10n.extensionsApprove),
          ),
        ],
      ),
    );
  }
}

Future<int?> _pickDuration(BuildContext context) {
  final l10n = AppLocalizations.of(context);
  return showDialog<int>(
    context: context,
    builder: (ctx) {
      int minutes = 30;
      return StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: Text(l10n.extensionsDurationDialogTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.extensionsDurationValue(minutes)),
              Slider(
                key: const Key('ext-duration-slider'),
                min: 5,
                max: 180,
                divisions: 35,
                value: minutes.toDouble(),
                label: l10n.extensionsDurationValue(minutes),
                onChanged: (v) => setDialogState(() => minutes = v.round()),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, null),
              child: Text(l10n.commonCancel),
            ),
            FilledButton(
              key: const Key('ext-duration-ok'),
              onPressed: () => Navigator.pop(ctx, minutes),
              child: Text(l10n.extensionsDurationConfirm),
            ),
          ],
        ),
      );
    },
  );
}
