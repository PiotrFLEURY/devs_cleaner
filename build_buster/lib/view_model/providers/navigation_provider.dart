import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_provider.g.dart';

enum NavigationItem { dashboard, caches, projects, settings }

@riverpod
class Navigation extends _$Navigation {
  @override
  NavigationItem build() {
    return NavigationItem.dashboard;
  }

  void setNavigationItem(NavigationItem item) {
    state = item;
  }
}
