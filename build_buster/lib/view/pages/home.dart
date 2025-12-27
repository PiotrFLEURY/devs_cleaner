import 'package:build_buster/view/pages/views/scan_results.dart';
import 'package:build_buster/view/pages/views/side_bar.dart';
import 'package:build_buster/view/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.mainBackground,
      body: Row(
        children: [
          SideBar(),
          Expanded(child: ScanResults()),
        ],
      ),
    );
  }
}
