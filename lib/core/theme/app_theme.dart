import 'package:flutter/material.dart';
import 'app_colors.dart';
class AppTheme {
  AppTheme._();
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    useMaterial3: true,
  );
}