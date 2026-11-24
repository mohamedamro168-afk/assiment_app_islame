import 'package:flutter/material.dart';
import 'package:app_islame/core/theme/app_colors.dart';
import 'package:app_islame/features/home/presentation/tabs/hadith_tab.dart';
import 'package:app_islame/features/home/presentation/tabs/quran_tab.dart';
import 'package:app_islame/features/home/presentation/tabs/radio_tab.dart';
import 'package:app_islame/features/home/presentation/tabs/sebha_tab.dart';
import 'package:app_islame/features/home/presentation/tabs/time_tab.dart';
import 'package:app_islame/features/home/presentation/widgets/app_bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = const [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _tabs,
        ),
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}