import 'package:build_buster/view/pages/views/caches.dart';
import 'package:build_buster/view/pages/views/projects_table.dart';
import 'package:build_buster/view/theme.dart';
import 'package:flutter/material.dart';

class ScanResults extends StatelessWidget {
  const ScanResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.mainBackground,
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 32.0,
        children: [
          Caches(),
          Expanded(child: Projects()),
        ],
      ),
    );
  }
}
