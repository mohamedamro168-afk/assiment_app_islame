import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_islame/core/constants/app_assets.dart';
import 'package:app_islame/core/theme/app_colors.dart';

const String _verse = 'سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى';

const List<String> _azkar = [
  'سبحان الله',
  'الحمد الله',
  'الله أكبر',
];

const int _target = 33;

const double _headAngle = 0;

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int _count = 0;
  int _zekrIndex = 0;
  double _turns = 0;

  void _onTap() {
    HapticFeedback.lightImpact();
    setState(() {
      _turns += 1 / _target;
      _count++;

      if (_count >= _target) {
        _count = 0;
        _zekrIndex = (_zekrIndex + 1) % _azkar.length;
      }
    });
  }

  void _reset() {
    setState(() {
      _count = 0;
      _zekrIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final ringSize = width * 0.74;

    final headWidth = ringSize * 0.2;
    final headHeight = headWidth * 344 / 292;
    final headOverhang = headHeight * 0.78;
    final headLeft = ringSize / 2 - headWidth * 0.26;

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          AppAssets.sebhaBg,
          fit: BoxFit.cover,
          cacheWidth: 1080,
          errorBuilder: (_, _, _) => const SizedBox.shrink(),
        ),
        const ColoredBox(color: Color(0x99000000)),

        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
              child: Row(
                children: [
                  const SizedBox(width: 48),
                  const Expanded(
                    child: Text(
                      _verse,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _reset,
                    icon: const Icon(Icons.refresh, color: AppColors.gold),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Center(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: _onTap,
                  child: SizedBox(
                    width: ringSize,
                    height: ringSize + headOverhang,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: headOverhang,
                          left: 0,
                          width: ringSize,
                          height: ringSize,
                          child: AnimatedRotation(
                            turns: _turns,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeOut,
                            child: Image.asset(
                              AppAssets.sebhaBody,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: headLeft,
                          child: Transform.rotate(
                            angle: _headAngle,
                            child: Image.asset(
                              AppAssets.sebhaHead,
                              width: headWidth,
                            ),
                          ),
                        ),

                        Positioned(
                          top: headOverhang,
                          left: ringSize * 0.2,
                          right: ringSize * 0.2,
                          height: ringSize,
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    _azkar[_zekrIndex],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  Text(
                                    '$_count',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}