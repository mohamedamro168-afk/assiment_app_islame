import 'package:flutter/material.dart';
import 'package:app_islame/core/constants/app_assets.dart';
import 'package:app_islame/core/theme/app_colors.dart';
import 'package:app_islame/features/intro/presentation/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const IntroScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Image.asset(
          AppAssets.headerLogo,
          width: MediaQuery.of(context).size.width * 0.6,
          errorBuilder: (_, _, _) => const Text(
            'Islami',
            style: TextStyle(
              color: AppColors.gold,
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}