import 'package:flutter/material.dart';
import 'package:app_islame/core/theme/app_colors.dart';
class TabPlaceholder extends StatelessWidget {
  final String title;

  const TabPlaceholder({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.gold,
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}