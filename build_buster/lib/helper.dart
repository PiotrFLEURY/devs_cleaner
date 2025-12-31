import 'dart:convert';
import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

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

  await launchBackend(serverPath);
}

Future<Process?> launchBackend(String backendPath) async {
  Process? process;

  try {
    if (Platform.isWindows) {
      // Sur Windows, on utilise PowerShell pour garantir l'accès au PATH système
      process = await Process.start('powershell.exe', [
        '-ExecutionPolicy', 'Bypass',
        '-NoProfile', // On évite de charger le profil pour la vitesse
        '-Command', '& "$backendPath"',
      ], runInShell: true);
    } else {
      // Sur macOS/Linux, on utilise le shell par défaut de l'utilisateur
      // L'argument -l (login) est la clé : il charge le .zshrc ou .bashrc
      final shell = Platform.environment['SHELL'] ?? '/bin/sh';

      process = await Process.start(shell, ['-l', '-c', backendPath]);
    }

    // Capture des logs pour le debug (essentiel pour les devs)
    process.stdout
        .transform(utf8.decoder)
        .listen((data) => debugPrint('BACKEND: $data'));
    process.stderr
        .transform(utf8.decoder)
        .listen((data) => debugPrint('BACKEND ERROR: $data'));

    return process;
  } catch (e) {
    debugPrint("Erreur fatale lors du lancement du backend : $e");
    return null;
  }
}

bool get shouldStartServer {
  const startServer = bool.fromEnvironment('START_SERVER', defaultValue: false);
  return startServer;
}
