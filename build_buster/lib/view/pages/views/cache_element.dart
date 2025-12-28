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
    required this.onRefresh,
    this.onOpen,
  });

  final String label;
  final double percentage;
  final String diskUsageGb;
  final Color color;
  final String buttonLabel;
  final VoidCallback onClean;
  final VoidCallback onRefresh;
  final VoidCallback? onOpen;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
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
          Row(
            children: [
              IconButton(
                onPressed: onRefresh,
                icon: Icon(Icons.refresh, color: AppTheme.mainText, size: 20),
              ),
              IconButton(
                icon: Icon(
                  Icons.cleaning_services_outlined,
                  color: AppTheme.mainText,
                  size: 20,
                ),
                onPressed: onClean,
              ),
              if (onOpen != null)
                IconButton(
                  onPressed: onOpen,
                  icon: Icon(
                    Icons.info_outline,
                    color: AppTheme.mainText,
                    size: 20,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
