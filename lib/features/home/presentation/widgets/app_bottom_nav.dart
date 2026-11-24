import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_islame/core/constants/app_assets.dart';
import 'package:app_islame/core/theme/app_colors.dart';

class NavItemData {
  final String? iconAsset;
  final IconData? icon;
  final String label;

  const NavItemData({
    this.iconAsset,
    this.icon,
    required this.label,
  }) : assert(iconAsset != null || icon != null);
}

const List<NavItemData> navItems = [
  NavItemData(iconAsset: AppAssets.quranIcon, label: 'Quran'),
  NavItemData(icon: Icons.menu_book, label: 'Hadith'),
  NavItemData(iconAsset: AppAssets.sebhaIcon, label: 'Sebha'),
  NavItemData(iconAsset: AppAssets.radioIcon, label: 'Radio'),
  NavItemData(iconAsset: AppAssets.timeIcon, label: 'Time'),
];

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.navBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(navItems.length, (i) {
              final item = navItems[i];
              final selected = i == currentIndex;

              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onTap(i),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: selected
                            ? AppColors.navSelected
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: _NavIcon(
                        item: item,
                        color: selected ? Colors.white : AppColors.navIcon,
                      ),
                    ),
                    if (selected) ...[
                      const SizedBox(height: 4),
                      Text(
                        item.label,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final NavItemData item;
  final Color color;
  static const double _size = 28;

  const _NavIcon({required this.item, required this.color});

  @override
  Widget build(BuildContext context) {
    final asset = item.iconAsset;
    if (asset != null) {
      if (asset.toLowerCase().endsWith('.svg')) {
        return SvgPicture.asset(
          asset,
          width: _size,
          height: _size,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        );
      }
      return Image.asset(
        asset,
        width: _size,
        height: _size,
        fit: BoxFit.contain,
        color: color,
        colorBlendMode: BlendMode.srcIn,
      );
    }

    return Icon(
      item.icon,
      size: _size,
      color: color,
    );
  }
}