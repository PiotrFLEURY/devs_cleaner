import 'package:build_buster/view/pages/home.dart';
import 'package:flutter/material.dart';

class BuildBuster extends StatelessWidget {
  const BuildBuster({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Build Buster', home: HomePage());
  }
}
