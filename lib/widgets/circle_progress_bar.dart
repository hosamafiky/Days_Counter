import 'package:days_counter/constants/palette.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircleProgress extends CustomPainter {
  final double arc;
  final bool isBackground;
  final Color progressColor;

  CircleProgress(this.arc, this.isBackground, this.progressColor);
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = const Rect.fromLTWH(0, 0, 250, 250);
    const startAngle = -math.pi;
    const sweepAngle = math.pi;
    const useCenter = false;
    final backgroundPaint = Paint()
      ..color = progressColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;
    final paint = Paint()
      ..color = Palette.kThirdColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, backgroundPaint);
    canvas.drawArc(rect, startAngle, arc * math.pi, useCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
