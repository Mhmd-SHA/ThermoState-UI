import 'dart:math';

import 'package:flutter/material.dart';
import 'package:thermostate_ui/app_colors.dart';

class ThermostatArcPainter extends CustomPainter {
  final Color circleColor;

  ThermostatArcPainter({this.circleColor = Colors.white});

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = size.width * 0.4; // Adjust size if needed

    var dashBrush =
        Paint()
          ..color = Colors.yellow
          ..strokeWidth = size.width * 0.00125
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;
    final centerBrush =
        Paint()
          ..color = circleColor
          ..style = PaintingStyle.stroke
          ..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

            colors: [AppColors.coolBlue, AppColors.warmYellow],
          ).createShader(Rect.fromCircle(center: center, radius: radius))
          ..strokeWidth = size.width * 0.0575;
    canvas.drawCircle(center, radius * 0.925, centerBrush);

    //inner lines
    var outerCircleRadius = radius - 15;
    var innerCircleRadius = radius - 12.5;
    for (var i = 0; i < 360; i += 1) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerY + outerCircleRadius * sin(i * pi / 180);
      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerY + innerCircleRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
    //inner lines big one
    var outerCircleRadiusLong = radius - 16.5;
    var innerCircleRadiusLong = radius - 12.5;
    for (var i = 0; i < 360; i += 15) {
      var x1 = centerX + outerCircleRadiusLong * cos(i * pi / 180);
      var y1 = centerY + outerCircleRadiusLong * sin(i * pi / 180);
      var x2 = centerX + innerCircleRadiusLong * cos(i * pi / 180);
      var y2 = centerY + innerCircleRadiusLong * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }

    // ring lines   var outerCircleRadiusLong = radius - 16.5;
    var ringRadiusOuter = radius - 5;

    var ringradiusInner = radius - 7.5;
    for (var i = 0; i < 360; i += 15) {
      var x1 = centerX + ringRadiusOuter * cos(i * pi / 180);
      var y1 = centerY + ringRadiusOuter * sin(i * pi / 180);
      var x2 = centerX + ringradiusInner * cos(i * pi / 180);
      var y2 = centerY + ringradiusInner * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
