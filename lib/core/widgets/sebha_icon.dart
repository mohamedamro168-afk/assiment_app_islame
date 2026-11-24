import 'dart:math' as math;
import 'package:flutter/material.dart';

class SebhaIcon extends StatelessWidget {
  final Color color;
  final double size;

  const SebhaIcon({super.key, required this.color, this.size = 28});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(size),
      painter: _SebhaIconPainter(color),
    );
  }
}

class _SebhaIconPainter extends CustomPainter {
  final Color color;

  _SebhaIconPainter(this.color);

  static const List<Offset> _loop = [
    Offset(520, 250),
    Offset(540, 190),
    Offset(545, 150),
    Offset(520, 115),
    Offset(455, 100),
    Offset(380, 115),
    Offset(300, 150),
    Offset(230, 200),
    Offset(180, 260),
    Offset(165, 320),
    Offset(185, 380),
    Offset(225, 415),
    Offset(270, 420),
    Offset(310, 395),
    Offset(335, 350),
    Offset(355, 290),
    Offset(385, 225),
    Offset(420, 190),
    Offset(460, 180),
    Offset(505, 188),
  ];

  static const List<Offset> _left = [
    Offset(520, 250),
    Offset(498, 280),
    Offset(476, 315),
    Offset(468, 352),
  ];

  static const List<Offset> _right = [
    Offset(520, 250),
    Offset(524, 290),
    Offset(527, 325),
    Offset(525, 355),
  ];

  Offset _fit(Offset p) {
    return Offset((p.dx - 165) * 0.2 + 10, (p.dy - 100) * 0.2 + 16);
  }

  Path _smooth(List<Offset> raw) {
    final p = raw.map(_fit).toList();
    final path = Path()..moveTo(p.first.dx, p.first.dy);

    for (var i = 0; i < p.length - 1; i++) {
      final p0 = i == 0 ? p[i] : p[i - 1];
      final p1 = p[i];
      final p2 = p[i + 1];
      final p3 = i + 2 < p.length ? p[i + 2] : p[i + 1];

      final c1 = p1 + (p2 - p0) / 6;
      final c2 = p2 - (p3 - p1) / 6;

      path.cubicTo(c1.dx, c1.dy, c2.dx, c2.dy, p2.dx, p2.dy);
    }
    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width / 96);

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    const dash = 8.5;
    const gap = 4.6;

    for (final metric in _smooth(_loop).computeMetrics()) {
      var d = 0.0;
      while (d < metric.length) {
        final end = math.min(d + dash, metric.length);
        canvas.drawPath(metric.extractPath(d, end), paint);
        d += dash + gap;
      }
    }

    canvas.drawPath(_smooth(_left), paint);
    canvas.drawPath(_smooth(_right), paint);
  }

  @override
  bool shouldRepaint(covariant _SebhaIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}