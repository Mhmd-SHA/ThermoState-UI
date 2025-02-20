import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../app_colors.dart';
import '../pages/home_page.dart';

class ModeSwitcher extends StatelessWidget {
  const ModeSwitcher({
    super.key,
    required this.autoModeShadowAnimation,
    required this.thermoMode,
    required this.thermoModeAUTOController,
    required this.thermoModeCOOLController,
    required this.thermoModeHOTController,
    required this.temperature,
    required this.autoModeBlurAnimation,
    required this.autoModeBottomBarAnimation,
    required this.coolModeShadowAnimation,
    required this.coolModeBlurAnimation,
    required this.coolModeBottomBarAnimation,
    required this.hotModeShadowAnimation,
    required this.hotModeBlurAnimation,
    required this.hotModeBottomBarAnimation,
    required this.coolRotateAnimation,
    required this.hotRotateAnimation,
  });

  final double autoModeShadowAnimation;
  final ValueNotifier<ThermoMode> thermoMode;
  final AnimationController thermoModeAUTOController;
  final AnimationController thermoModeCOOLController;
  final AnimationController thermoModeHOTController;
  final ValueNotifier<double> temperature;
  final double autoModeBlurAnimation;
  final double autoModeBottomBarAnimation;
  final double coolModeShadowAnimation;
  final double coolModeBlurAnimation;
  final double coolModeBottomBarAnimation;
  final double hotModeShadowAnimation;
  final double hotModeBlurAnimation;
  final double hotModeBottomBarAnimation;
  final double coolRotateAnimation;
  final double hotRotateAnimation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              width: 150.w,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8).r,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: autoModeShadowAnimation,
                      color: Colors.greenAccent,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
                child: MaterialButton(
                  onPressed: () {
                    thermoMode.value = ThermoMode.AUTO;
                    thermoModeAUTOController.forward(from: 0);
                    thermoModeCOOLController.reverse();
                    thermoModeHOTController.reverse();

                    temperature.value = 25;
                  },
                  height: 80.h,
                  padding: EdgeInsets.all(16).r,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8).r,
                  ),
                  color: AppColors.containerBackground,
                  splashColor: Colors.greenAccent.shade100.withOpacity(0.3),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GlowText(
                        "Auto",
                        glowColor: Colors.greenAccent,
                        blurRadius: autoModeBlurAnimation,
                        offset: Offset(0, 0),
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      15.verticalSpace,
                      GlowIcon(
                        Icons.motion_photos_auto_sharp,
                        blurRadius: autoModeBlurAnimation,
                        color: Colors.greenAccent,
                        offset: Offset(0, 0),
                        size: 25.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GlowContainer(
              margin: EdgeInsets.symmetric(horizontal: 4).r,
              alignment: Alignment.center,
              width: autoModeBottomBarAnimation,
              height: 4.h,
              borderRadius: BorderRadius.circular(4).r,
              color: Colors.greenAccent,
              blurRadius: autoModeBlurAnimation,
              offset: Offset(0, 0),
              glowColor: Colors.greenAccent,
            ),
          ],
        ),
        12.verticalSpace,
        SizedBox(
          width: 150.w,
          child: Row(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8).r,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: coolModeShadowAnimation,
                            color: AppColors.coolBlue,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          thermoMode.value = ThermoMode.COOL;
                          thermoModeCOOLController.forward(from: 0);
                          thermoModeAUTOController.reverse();
                          thermoModeHOTController.reverse();

                          temperature.value = 18.5;
                        },
                        height: 80.h,
                        padding: EdgeInsets.all(16).r,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        color: AppColors.containerBackground,
                        splashColor: AppColors.coolBlue.withOpacity(0.3),
                        child: Transform.rotate(
                          angle: coolRotateAnimation * pi,
                          child: GlowIcon(
                            FontAwesomeIcons.snowflake,
                            size: 25.sp,
                            offset: Offset(0, 0),
                            blurRadius: coolModeBlurAnimation,
                            color: AppColors.coolBlue,
                            glowColor: AppColors.coolBlue,
                          ),
                        ),
                      ),
                    ),
                    GlowContainer(
                      margin:
                          EdgeInsets.symmetric(
                            horizontal: coolModeBottomBarAnimation,
                          ).r,
                      alignment: Alignment.center,
                      height: 4.h,
                      borderRadius: BorderRadius.circular(4).r,
                      color: AppColors.coolBlue,
                      blurRadius: coolModeBlurAnimation,
                      offset: Offset(0, 0),
                      glowColor: AppColors.coolBlue,
                    ),
                  ],
                ),
              ),
              8.horizontalSpace,
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8).r,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: hotModeShadowAnimation,
                            color: AppColors.warmYellow,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          thermoMode.value = ThermoMode.HOT;

                          thermoModeHOTController.forward(from: 0);
                          thermoModeCOOLController.reverse();
                          thermoModeAUTOController.reverse();

                          temperature.value = 35;
                        },
                        height: 80.h,
                        padding: EdgeInsets.all(16).r,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        color: AppColors.containerBackground,
                        splashColor: AppColors.warmYellow.withOpacity(0.3),
                        child: Transform.rotate(
                          angle: hotRotateAnimation,
                          child: GlowIcon(
                            Icons.wb_sunny,
                            size: 25.sp,
                            color: AppColors.warmYellow,
                            offset: Offset(0, 0),
                            blurRadius: hotModeBlurAnimation,
                            glowColor: AppColors.warmYellow,
                          ),
                        ),
                      ),
                    ),
                    GlowContainer(
                      margin:
                          EdgeInsets.symmetric(
                            horizontal: hotModeBottomBarAnimation,
                          ).r,
                      alignment: Alignment.center,
                      height: 4.h,
                      borderRadius: BorderRadius.circular(4).r,
                      color: AppColors.warmYellow,
                      blurRadius: hotModeBlurAnimation,
                      offset: Offset(0, 0),
                      glowColor: AppColors.warmYellow,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
