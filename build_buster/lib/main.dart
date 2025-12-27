import 'package:build_buster/build_buster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      retry: (retryCount, error) => null,
      child: const BuildBuster(),
    ),
  );
}
