import 'package:build_buster/view/pages/home.dart';
import 'package:build_buster/view_model/providers/dev_cache_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_window_close/flutter_window_close.dart';

class BuildBuster extends ConsumerStatefulWidget {
  const BuildBuster({super.key});

  @override
  ConsumerState<BuildBuster> createState() => _BuildBusterState();
}

class _BuildBusterState extends ConsumerState<BuildBuster> {
  @override
  void initState() {
    super.initState();
    FlutterWindowClose.setWindowShouldCloseHandler(() async {
      // Perform any necessary cleanup here before the window closes.
      await ref.read(devCacheRepositoryProvider).onShutdown();
      return true; // Return true to allow the window to close.
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Build Buster', home: HomePage());
  }
}
