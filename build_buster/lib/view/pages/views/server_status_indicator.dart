import 'package:build_buster/view/theme.dart';
import 'package:build_buster/view_model/backend_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServerStatusIndicator extends ConsumerWidget {
  const ServerStatusIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backendStatus = ref.watch(backendStatusProvider);
    return _content(context, ref, backendStatus);
  }

  Widget _content(
    BuildContext context,
    WidgetRef ref,
    BackendStatusState status,
  ) {
    String text;
    Color color;

    switch (status) {
      case BackendStatusState.running:
        text = 'Server Running';
        color = AppTheme.greenGradle;
        break;
      case BackendStatusState.starting:
        text = 'Server Starting...';
        color = AppTheme.yellowNpm;
        break;
      case BackendStatusState.stopping:
        text = 'Server Stopping...';
        color = AppTheme.yellowNpm;
        break;
      case BackendStatusState.stopped:
        text = 'Server Stopped';
        color = AppTheme.errorRed;
        break;
      case BackendStatusState.unknown:
        text = 'Server Status Unknown';
        color = AppTheme.secondaryText;
        break;
    }

    return Row(
      children: [
        Switch(
          value: status == BackendStatusState.running,

          onChanged:
              status == BackendStatusState.stopping ||
                  status == BackendStatusState.starting
              ? null
              : (value) {
                  ref.read(backendStatusProvider.notifier).toggleBackend();
                },
        ),
        const SizedBox(width: 6),
        Icon(Icons.circle, color: color, size: 12),
        const SizedBox(width: 6),
        Text(text, style: TextStyle(color: color, fontSize: 12)),
      ],
    );
  }
}
