import 'package:build_buster/build_buster.dart';
import 'package:build_buster/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

late PackageInfo packageInfo;

Future<void> initializePackageInfo() async {
  packageInfo = await PackageInfo.fromPlatform();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await installServer();
  await initializePackageInfo();
  runApp(
    ProviderScope(
      retry: (retryCount, error) => null,
      child: const BuildBuster(),
    ),
  );
}
