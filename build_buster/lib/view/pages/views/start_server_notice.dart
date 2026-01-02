import 'package:build_buster/view/theme.dart';
import 'package:flutter/material.dart';

class StartServerNotice extends StatelessWidget {
  const StartServerNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withAlpha(10),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Text(
              'Please start the server to use the application.',
              style: TextStyle(fontSize: 24, color: AppTheme.secondaryText),
            ),
            Text(
              'Use the switch at the bottom right corner.',
              style: TextStyle(fontSize: 12, color: AppTheme.secondaryText),
            ),
          ],
        ),
      ),
    );
  }
}
