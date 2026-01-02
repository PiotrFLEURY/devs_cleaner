import 'package:build_buster/view/pages/views/caches.dart';
import 'package:build_buster/view/pages/views/projects_table.dart';
import 'package:build_buster/view/theme.dart';
import 'package:build_buster/view_model/home_page_view_model.dart';
import 'package:build_buster/view_model/providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScanResults extends ConsumerWidget {
  const ScanResults({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationItem = ref.watch(navigationProvider);
    final homePageState = ref.watch(homePageViewModelProvider);
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppTheme.mainBackground,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32.0,
            children: [
              if (navigationItem == NavigationItem.dashboard)
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        homePageState.toFormattedTotalSizeString(),
                        style: TextStyle(
                          color: AppTheme.mainText,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Total size used by caches and projects',
                        style: TextStyle(
                          color: AppTheme.secondaryText,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

              if (navigationItem == NavigationItem.caches ||
                  navigationItem == NavigationItem.dashboard)
                Caches(),
              if (navigationItem == NavigationItem.projects ||
                  navigationItem == NavigationItem.dashboard)
                Projects(),
            ],
          ),
        ),
      ),
    );
  }
}
