import 'package:build_buster/view/pages/views/cache_element.dart';
import 'package:build_buster/view/theme.dart';
import 'package:build_buster/view_model/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Caches extends ConsumerWidget {
  const Caches({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                ref.read(homePageViewModelProvider.notifier).fetchData();
              },
              icon: Icon(Icons.refresh),
            ),
            Text(
              'Total cache size: ${viewModel.toFormattedString(viewModel.totalCacheSizeInBytes)}',
              style: TextStyle(color: AppTheme.secondaryText),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 16.0,
            children: [
              CacheElement(
                label: 'Docker Images &\nVolumes',
                percentage: viewModel.dockerPercentageUsed,
                diskUsageGb: viewModel.dockerCacheToFormattedString(),
                color: AppTheme.dockerBlue,
                buttonLabel: 'Clean Docker Cache',
                onClean: () {
                  confirmCacheCleanup(context, 'Docker', () {
                    ref
                        .read(homePageViewModelProvider.notifier)
                        .deleteDockerCache();
                  });
                },
                onRefresh: () {
                  ref
                      .read(homePageViewModelProvider.notifier)
                      .refreshDockerCache();
                },
                onOpen: () {
                  // Open Docker cache details page
                  _openDockerCacheDetails(context, viewModel.dockerSystemDf);
                },
              ),
              CacheElement(
                label: 'Maven Local\nRepository',
                percentage: viewModel.mavenPercentageUsed,
                diskUsageGb: viewModel.mavenLocalToFormattedString(),
                color: AppTheme.mavenOrange,
                buttonLabel: 'Clean Maven Cache',
                onClean: () {
                  confirmCacheCleanup(context, 'Maven Local Repository', () {
                    ref
                        .read(homePageViewModelProvider.notifier)
                        .deleteMavenLocal();
                  });
                },
                onRefresh: () {
                  ref
                      .read(homePageViewModelProvider.notifier)
                      .refreshMavenLocal();
                },
              ),
              CacheElement(
                label: 'Gradle Build\nCache',
                percentage: viewModel.gradlePercentageUsed,
                diskUsageGb: viewModel.gradleCacheToFormattedString(),
                color: AppTheme.greenGradle,
                buttonLabel: 'Clean Gradle Cache',
                onClean: () {
                  confirmCacheCleanup(context, 'Gradle Build', () {
                    ref
                        .read(homePageViewModelProvider.notifier)
                        .deleteGradleCache();
                  });
                },
                onRefresh: () {
                  ref
                      .read(homePageViewModelProvider.notifier)
                      .refreshGradleCache();
                },
              ),
              CacheElement(
                label: 'Pub Global Cache\n(Dart/Flutter)',
                percentage: viewModel.pubPercentageUsed,
                diskUsageGb: viewModel.pubCacheToFormattedString(),
                color: AppTheme.violetPub,
                buttonLabel: 'Clean Pub Cache',
                onClean: () {
                  confirmCacheCleanup(context, 'Pub Global', () {
                    ref
                        .read(homePageViewModelProvider.notifier)
                        .deletePubCache();
                  });
                },
                onRefresh: () {
                  ref
                      .read(homePageViewModelProvider.notifier)
                      .refreshPubCache();
                },
              ),
              CacheElement(
                label: 'Npm Cache',
                percentage: viewModel.npmPercentageUsed,
                diskUsageGb: viewModel.npmCacheToFormattedString(),
                color: AppTheme.yellowNpm,
                buttonLabel: 'Clean Npm Cache',
                onClean: () {
                  confirmCacheCleanup(context, 'Npm', () {
                    ref
                        .read(homePageViewModelProvider.notifier)
                        .deleteNpmCache();
                  });
                },
                onRefresh: () {
                  ref
                      .read(homePageViewModelProvider.notifier)
                      .refreshNpmCache();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void confirmCacheCleanup(
    BuildContext context,
    String cacheName,
    VoidCallback onConfirm,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Cleanup'),
          content: Text('Are you sure you want to delete $cacheName cache?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onConfirm();
                Navigator.of(context).pop();
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _openDockerCacheDetails(
    BuildContext context,
    DockerSystemDfWrapper dockerCache,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Docker Cache Details'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
          content: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              spacing: 8.0,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Images Size:'),
                    Text(
                      dockerCache.imagesSize,
                      style: TextStyle(color: AppTheme.secondaryText),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Containers Size:'),
                    Text(
                      dockerCache.containersSize,
                      style: TextStyle(color: AppTheme.secondaryText),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Volumes Size:'),
                    Text(
                      dockerCache.volumesSize,
                      style: TextStyle(color: AppTheme.secondaryText),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Build Cache Size:'),
                    Text(
                      dockerCache.buildCacheSize,
                      style: TextStyle(color: AppTheme.secondaryText),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
