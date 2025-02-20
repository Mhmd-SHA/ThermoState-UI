import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thermostate_ui/paints/outer_ring.dart';
import 'package:thermostate_ui/widgets/temp_arc_changer.dart';

class ArcPainterPage extends StatelessWidget {
  const ArcPainterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanDown: (details) => print("DOWNN"),
        child: CustomPaint(
          size: Size.fromWidth(ScreenUtil().screenWidth),
          isComplex: true,
          willChange: true,
          painter: ThermostatArcOuterPainter(),
          child: Transform.rotate(
            angle: 20,
            child: CustomPaint(
              isComplex: true,
              size: Size.fromWidth(ScreenUtil().screenWidth),
              willChange: true,
              painter: ThermostatArcPainter(),
            ),
          ),
        ),
      ),
    );
  }
}
