import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:windig/models/common.dart';

// CustomPainter to draw a wind direction indicator
class WindCompassPainter extends CustomPainter {
  final double compassHeading;
  final Direction windDirection;

  WindCompassPainter({
    required this.compassHeading,
    required this.windDirection,
  });

  // Map wind direction string to angle in degrees
  double _directionToDegrees(Direction direction) {
    switch (direction) {
      case Direction.N:
        return 180; // 0;
      case Direction.NE:
        return 225; // 45;
      case Direction.E:
        return 270; // 90;
      case Direction.SE:
        return 315; // 135;
      case Direction.S:
        return 0; // 180;
      case Direction.SW:
        return 45; // 225;
      case Direction.W:
        return 90; // 270;
      case Direction.NW:
        return 135; // 315;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint circlePaint = Paint()
      ..color = Colors.grey.withAlpha((0.3 * 255).toInt())
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final Paint arrowPaint = Paint()
      ..color = Colors.lightBlueAccent
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 8;

    // Draw compass circle
    canvas.drawCircle(center, radius, circlePaint);

    // Calculate wind direction angle relative to compass heading
    final windDeg = _directionToDegrees(windDirection);
    final angle = ((windDeg - compassHeading) * (math.pi / 180));

    // Draw wind direction arrow
    final arrowLength = radius - 10;
    final arrowTip = Offset(
      center.dx + arrowLength * math.sin(angle),
      center.dy - arrowLength * math.cos(angle),
    );

    final arrowBaseLeft = Offset(
      center.dx + 10 * math.sin(angle + math.pi / 2),
      center.dy - 10 * math.cos(angle + math.pi / 2),
    );
    final arrowBaseRight = Offset(
      center.dx + 10 * math.sin(angle - math.pi / 2),
      center.dy - 10 * math.cos(angle - math.pi / 2),
    );

    final path = Path()
      ..moveTo(arrowTip.dx, arrowTip.dy)
      ..lineTo(arrowBaseLeft.dx, arrowBaseLeft.dy)
      ..lineTo(arrowBaseRight.dx, arrowBaseRight.dy)
      ..close();

    canvas.drawPath(path, arrowPaint);
  }

  @override
  bool shouldRepaint(covariant WindCompassPainter oldDelegate) {
    return compassHeading != oldDelegate.compassHeading ||
        windDirection != oldDelegate.windDirection;
  }
}
