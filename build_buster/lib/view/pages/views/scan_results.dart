import 'package:build_buster/view/pages/views/caches.dart';
import 'package:build_buster/view/pages/views/projects_table.dart';
import 'package:build_buster/view/theme.dart';
import 'package:build_buster/view_model/home_page_view_model.dart';
import 'package:build_buster/view_model/providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScanResults extends ConsumerStatefulWidget {
  const ScanResults({super.key});

  @override
  ConsumerState<ScanResults> createState() => _ScanResultsState();
}

class _ScanResultsState extends ConsumerState<ScanResults> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homePageViewModelProvider.notifier).fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final navigationItem = ref.watch(navigationProvider);
    return Container(
      color: AppTheme.mainBackground,
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 32.0,
        children: [
          if (navigationItem == NavigationItem.caches ||
              navigationItem == NavigationItem.dashboard)
            Caches(),
          if (navigationItem == NavigationItem.projects ||
              navigationItem == NavigationItem.dashboard)
            Expanded(child: Projects()),
        ],
      ),
    );
  }
}
