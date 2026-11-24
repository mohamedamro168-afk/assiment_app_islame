import 'package:flutter/material.dart';
import 'package:app_islame/core/theme/app_theme.dart';
import 'package:app_islame/features/splash/presentation/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islami',
      theme: AppTheme.dark,
      home: const SplashScreen(),
    );
  }
}