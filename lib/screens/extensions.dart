import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ipc/dto.dart';
import '../state/auth_controller.dart';
import '../state/extension_controller.dart';

class ExtensionsScreen extends ConsumerWidget {
  const ExtensionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pending = ref.watch(pendingExtensionsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Demandes en attente')),
      body: pending.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur : $e')),
        data: (list) {
          if (list.isEmpty) {
            return const Center(child: Text('Aucune demande en attente'));
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
        SnackBar(content: Text('Approbation impossible : $e')),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _deny() async {
    setState(() => _busy = true);
    try {
      final c = await ref.read(ipcClientProvider.future);
      await c.call('extension.deny', {'ticket_id': widget.entry.id});
      ref.invalidate(pendingExtensionsProvider);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Refus impossible : $e')),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final e = widget.entry;
    return ListTile(
      title: Text(e.reason ?? '(sans motif)'),
      subtitle: Text(
        'Créée le ${e.createdAt.toLocal().toString().split('.').first}',
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            key: Key('ext-deny-${e.id}'),
            onPressed: _busy ? null : _deny,
            child: const Text('Refuser'),
          ),
          const SizedBox(width: 4),
          FilledButton(
            key: Key('ext-approve-${e.id}'),
            onPressed: _busy ? null : _approve,
            child: const Text('Approuver'),
          ),
        ],
      ),
    );
  }
}

Future<int?> _pickDuration(BuildContext context) {
  return showDialog<int>(
    context: context,
    builder: (ctx) {
      int minutes = 30;
      return StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text("Durée de l'extension"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$minutes min'),
              Slider(
                key: const Key('ext-duration-slider'),
                min: 5,
                max: 180,
                divisions: 35,
                value: minutes.toDouble(),
                label: '$minutes min',
                onChanged: (v) => setDialogState(() => minutes = v.round()),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, null),
              child: const Text('Annuler'),
            ),
            FilledButton(
              key: const Key('ext-duration-ok'),
              onPressed: () => Navigator.pop(ctx, minutes),
              child: const Text('Valider'),
            ),
          ],
        ),
      );
    },
  );
}
