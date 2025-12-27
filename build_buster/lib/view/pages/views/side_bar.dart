import 'package:build_buster/view/theme.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.sideBar,
      width: 200,
      child: NavigationRail(
        backgroundColor: AppTheme.sideBar,
        extended: true,
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
          NavigationRailDestination(
            icon: Icon(Icons.settings, color: AppTheme.border),
            label: Text('Settings', style: TextStyle(color: AppTheme.mainText)),
          ),
        ],
        selectedIndex: 0,
      ),
    );
  }
}
