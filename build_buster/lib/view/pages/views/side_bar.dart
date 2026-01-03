import 'package:build_buster/main.dart';
import 'package:build_buster/view/theme.dart';
import 'package:build_buster/view_model/providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SideBar extends ConsumerStatefulWidget {
  const SideBar({super.key});

  @override
  ConsumerState<SideBar> createState() => _SideBarState();
}

class _SideBarState extends ConsumerState<SideBar> {
  bool isExtended = true;

  void toggleExtended() {
    setState(() {
      isExtended = !isExtended;
    });
  }

  @override
  Widget build(BuildContext context) {
    final navigationItem = ref.watch(navigationProvider);
    return Container(
      color: AppTheme.sideBar,
      child: NavigationRail(
        backgroundColor: AppTheme.sideBar,
        extended: isExtended,
        destinations: [
          NavigationRailDestination(
            icon: Icon(Icons.dashboard, color: AppTheme.border),
            label: Text(
              'Dashboard',
              style: TextStyle(color: AppTheme.mainText),
            ),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.storage, color: AppTheme.border),
            label: Text('Caches', style: TextStyle(color: AppTheme.mainText)),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.code, color: AppTheme.border),
            label: Text('Projects', style: TextStyle(color: AppTheme.mainText)),
          ),
        ],
        selectedIndex: navigationItem.index,
        onDestinationSelected: (int index) {
          ref
              .read(navigationProvider.notifier)
              .setNavigationItem(NavigationItem.values[index]);
        },
        trailing: Column(
          children: [
            TextButton.icon(
              label: isExtended
                  ? Text(
                      'About',
                      style: TextStyle(color: AppTheme.secondaryText),
                    )
                  : const SizedBox.shrink(),
              icon: Icon(Icons.info_outline, color: AppTheme.secondaryText),
              onPressed: () => showAbout(context),
            ),
            IconButton(
              icon: Icon(
                isExtended
                    ? Icons.keyboard_double_arrow_left_outlined
                    : Icons.keyboard_double_arrow_right_outlined,
                color: AppTheme.secondaryText,
              ),
              onPressed: toggleExtended,
            ),
          ],
        ),
        trailingAtBottom: true,
      ),
    );
  }

  void showAbout(BuildContext context) {
    return showAboutDialog(
      context: context,
      applicationName: 'Build Buster',
      applicationVersion: packageInfo.version,
      applicationIcon: Image.asset(
        'assets/icon/icon.png',
        width: 48,
        height: 48,
      ),
      applicationLegalese: '© 2026 Piotr FLEURY',
    );
  }
}
