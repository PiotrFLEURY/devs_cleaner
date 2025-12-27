import 'package:build_buster/view/theme.dart';
import 'package:flutter/material.dart';

class CacheElement extends StatelessWidget {
  const CacheElement({
    super.key,
    required this.label,
    required this.percentage,
    required this.diskUsageGb,
    required this.color,
    required this.buttonLabel,
    required this.onClean,
  });

  final String label;
  final double percentage;
  final String diskUsageGb;
  final Color color;
  final String buttonLabel;
  final VoidCallback onClean;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        spacing: 16.0,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.mainText,
              fontWeight: FontWeight.w400,
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Text(
                '${percentage.round()} %',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.mainText,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 1 - (percentage / 100)),
                duration: Duration(milliseconds: 400),
                builder: (context, value, child) {
                  return CircularProgressIndicator(
                    value: value,
                    strokeWidth: 16.0,
                    constraints: BoxConstraints(minWidth: 96, minHeight: 96),
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      color.withAlpha(150),
                    ),
                  );
                },
              ),
            ],
          ),
          Text(
            diskUsageGb,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppTheme.mainText, fontSize: 18),
          ),
          ElevatedButton(
            onPressed: onClean,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white.withAlpha(10),
              foregroundColor: AppTheme.mainText,
            ),
            child: Text(buttonLabel),
          ),
        ],
      ),
    );
  }
}
