import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thermostate_ui/app_colors.dart';

class ThermostatArcOuterPainter extends CustomPainter {
  final Color circleColor;

  ThermostatArcOuterPainter({this.circleColor = Colors.white});

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    final radius = size.width * 0.4; // Adjust size if needed

    var dashBrush =
        Paint()
          ..color = AppColors.toggleActive
          ..strokeWidth = size.width * 0.00125
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;

    var outerCircleRadius = radius + 1.5;
    var innerCircleRadius = radius + 4.5;
    for (var i = 0; i < 360; i += 1) {
      if (i > 170 && i < 190) {
        if (i < 180) {
          innerCircleRadius += 0.55;
        } else {
          innerCircleRadius -= 0.55;
        }
      }

      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerY + outerCircleRadius * sin(i * pi / 180);
      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerY + innerCircleRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
