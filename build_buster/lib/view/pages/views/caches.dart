import 'package:build_buster/view/pages/views/cache_element.dart';
import 'package:build_buster/view/theme.dart';
import 'package:build_buster/view_model/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Caches extends ConsumerStatefulWidget {
  const Caches({super.key});

  @override
  ConsumerState<Caches> createState() => _CachesState();
}

class _CachesState extends ConsumerState<Caches> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homePageViewModelProvider.notifier).fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(homePageViewModelProvider);
    return Column(
      spacing: 24.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Caches',
              style: TextStyle(color: AppTheme.mainText, fontSize: 24),
            ),
            IconButton(
              onPressed: () {
                ref.invalidate(homePageViewModelProvider);
                ref.read(homePageViewModelProvider.notifier).fetchData();
              },
              icon: Icon(Icons.refresh),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 32.0,
            children: [
              CacheElement(
                label: 'Docker Images &\nVolumes',
                percentage: viewModel.dockerPercentageUsed,
                diskUsageGb: viewModel.dockerCacheToFormattedString(),
                color: AppTheme.dockerBlue,
                buttonLabel: 'Clean Docker Cache',
                onClean: () {},
              ),
              CacheElement(
                label: 'Maven Local\nRepository',
                percentage: viewModel.mavenPercentageUsed,
                diskUsageGb: viewModel.mavenLocalToFormattedString(),
                color: AppTheme.mavenOrange,
                buttonLabel: 'Clean Maven Cache',
                onClean: () {},
              ),
              CacheElement(
                label: 'Gradle Build\nCache',
                percentage: viewModel.gradlePercentageUsed,
                diskUsageGb: viewModel.gradleCacheToFormattedString(),
                color: AppTheme.greenGradle,
                buttonLabel: 'Clean Gradle Cache',
                onClean: () {},
              ),
              CacheElement(
                label: 'Pub Global Cache\n(Dart/Flutter)',
                percentage: viewModel.pubPercentageUsed,
                diskUsageGb: viewModel.pubCacheToFormattedString(),
                color: AppTheme.violetPub,
                buttonLabel: 'Clean Pub Cache',
                onClean: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
