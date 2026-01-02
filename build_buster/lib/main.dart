import 'package:build_buster/build_buster.dart';
import 'package:build_buster/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await installServer();
  runApp(
    ProviderScope(
      retry: (retryCount, error) => null,
      child: const BuildBuster(),
    ),
  );
}
