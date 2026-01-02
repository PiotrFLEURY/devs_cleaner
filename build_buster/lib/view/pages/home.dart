import 'package:build_buster/view/pages/views/scan_results.dart';
import 'package:build_buster/view/pages/views/server_status_indicator.dart';
import 'package:build_buster/view/pages/views/side_bar.dart';
import 'package:build_buster/view/pages/views/start_server_notice.dart';
import 'package:build_buster/view/theme.dart';
import 'package:build_buster/view_model/backend_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverStatus = ref.watch(backendStatusProvider);
    return Scaffold(
      backgroundColor: AppTheme.mainBackground,
      body: Row(
        children: [
          SideBar(),
          Expanded(
            child: serverStatus == BackendStatusState.running
                ? ScanResults()
                : StartServerNotice(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 48,
        color: AppTheme.mainBackground,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 10),
            Center(
              child: Text(
                '© 2026 Piotr FLEURY.',
                style: TextStyle(color: AppTheme.secondaryText, fontSize: 10),
              ),
            ),
            const Spacer(),
            ServerStatusIndicator(),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
