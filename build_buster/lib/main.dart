import 'dart:io';

import 'package:build_buster/build_buster.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String get serverPath {
  if (Platform.isWindows) {
    final user = Platform.environment['USERNAME'];
    return 'C:\\Users\\$user\\.build_buster\\devs_cleaner.exe';
  }
  if (Platform.isLinux) {
    final user = Platform.environment['USER'];
    return '/home/$user/.build_buster/devs_cleaner';
  }
  if (Platform.isMacOS) {
    final user = Platform.environment['USER'];
    return '/Users/$user/.build_buster/devs_cleaner';
  }
  throw UnsupportedError('Unsupported platform');
}

Future<void> startServer() async {
  final server = await rootBundle.load('assets/devs_cleaner');
  final bytes = server.buffer.asUint8List();

  // Getting containing directory from serverPath
  final serverDirectory = Directory(serverPath).parent;

  // Create the directory if it doesn't exist
  final directory = Directory(serverDirectory.path);
  if (!directory.existsSync()) {
    directory.createSync(recursive: true);
  }

  await File(serverPath).writeAsBytes(bytes, flush: true);
  await Process.run('chmod', ['+x', serverPath]);

  await Process.start(serverPath, [], mode: ProcessStartMode.inheritStdio);
}

bool get shouldStartServer {
  const startServer = bool.fromEnvironment('START_SERVER', defaultValue: false);
  return startServer;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (shouldStartServer) {
    await startServer();
  }
  runApp(
    ProviderScope(
      retry: (retryCount, error) => null,
      child: const BuildBuster(),
    ),
  );
}
