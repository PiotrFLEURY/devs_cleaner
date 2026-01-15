import 'package:build_buster/model/data/dev_project.dart';
import 'package:build_buster/view/theme.dart';
import 'package:build_buster/view_model/home_page_view_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Projects extends ConsumerWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(homePageViewModelProvider);
    return Column(
      spacing: 16.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Projects',
              style: TextStyle(color: AppTheme.mainText, fontSize: 24),
            ),
            IconButton(
              onPressed: () {
                ref.read(homePageViewModelProvider.notifier).refreshProjects();
              },
              icon: Icon(Icons.refresh),
            ),
          ],
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                _scanProjects(ref);
              },
              child: Text('Scan for Projects'),
            ),
            SizedBox(width: 16.0),
            Text(
              'Scanned Path: ${viewModel.projectsPath}',
              style: TextStyle(color: AppTheme.secondaryText),
            ),
          ],
        ),
        // Placeholder for project list
        Table(
          border: TableBorder.all(color: AppTheme.border),
          children: [
            TableRow(
              decoration: BoxDecoration(color: AppTheme.sideBar),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Project Path',
                    style: TextStyle(
                      color: AppTheme.mainText,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Technology',
                    style: TextStyle(
                      color: AppTheme.mainText,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Size',
                    style: TextStyle(
                      color: AppTheme.mainText,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            ...viewModel.sortedDevProjects.map((project) {
              return _buildProjectRow(viewModel, project, ref);
            }),
          ],
        ),
        Row(
          spacing: 16.0,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Total project size: ${viewModel.toFormattedString(viewModel.totalProjectSizeInBytes)}',
              style: TextStyle(color: AppTheme.secondaryText),
            ),
            ElevatedButton(
              onPressed: () {
                confirmProjectCleanup(context, viewModel.projectsPath, () {
                  ref
                      .read(homePageViewModelProvider.notifier)
                      .deleteAllBuildArtifacts();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.errorRed,
                foregroundColor: AppTheme.mainText,
              ),
              child: Text('Clean All Build Folders'),
            ),
          ],
        ),
      ],
    );
  }

  TableRow _buildProjectRow(
    HomePageState viewModel,
    DevProject project,
    WidgetRef ref,
  ) {
    return TableRow(
      decoration: BoxDecoration(color: AppTheme.mainText),
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              viewModel.shortenPath(project.path),
              style: TextStyle(color: AppTheme.secondaryText, fontSize: 12),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              project.technology,
              style: TextStyle(color: AppTheme.secondaryText, fontSize: 12),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  viewModel.toFormattedString(project.sizeInBytes),
                  style: TextStyle(color: AppTheme.secondaryText, fontSize: 12),
                ),
                Spacer(),
                if (project.hasBuildArtifact)
                  IconButton(
                    onPressed: () {
                      debugPrint('Delete build artifacts for ${project.path}');
                      confirmProjectCleanup(ref.context, project.path, () {
                        ref
                            .read(homePageViewModelProvider.notifier)
                            .deleteBuildArtifacts(project.path);
                      });
                    },
                    icon: Icon(Icons.delete_outline_outlined),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _scanProjects(WidgetRef ref) async {
    String? result = await FilePicker.platform.getDirectoryPath();
    if (result == null) {
      return; // User canceled the picker
    }
    ref.read(homePageViewModelProvider.notifier).fetchProjects(result);
  }

  bool _hasExtention(String path) {
    return path.split('/').last.contains('.');
  }

  void confirmProjectCleanup(
    BuildContext context,
    String projectPath,
    VoidCallback onConfirm,
  ) {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Cleanup'),
          content: Text(
            'Are you sure you want to delete build artifacts in $projectPath ?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Call cleanup function here
                onConfirm();
                Navigator.of(context).pop(); // Dismiss dialog
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}
