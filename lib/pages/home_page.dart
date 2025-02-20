import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thermostate_ui/app_colors.dart';
import 'package:thermostate_ui/paints/outer_ring.dart';
import 'package:thermostate_ui/widgets/temp_arc_changer.dart';
import 'package:thermostate_ui/widgets/temp_detail.dart';

import '../widgets/mode_switcher.dart';
import '../widgets/room_selection.dart';
import '../widgets/slider_widget.dart';
import '../widgets/temp_switch.dart';

enum ThermoMode { AUTO, COOL, HOT }

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final temperature = useState(30.0);
    final fanSpeed = useState(10.0);
    final isPowerOn = useState(true);
    final thermoMode = useState(ThermoMode.AUTO);

    // Slider AnimationController
    final sliderAnimationController = useAnimationController(
      duration: const Duration(seconds: 2),
    );
    // fan rotaion Animtaion
    final sliderFanRotationAnimation = useAnimation(
      sliderAnimationController.drive(Tween<double>(begin: 0, end: 1)),
    );

    // AUTO
    final thermoModeAUTOController = useAnimationController(
      duration: Duration(milliseconds: 500),
    );
    final autoModeBlurAnimation = useAnimation(
      thermoModeAUTOController.drive(Tween<double>(begin: 0, end: 20)),
    );

    final autoModeShadowAnimation = useAnimation(
      thermoModeAUTOController.drive(Tween<double>(begin: 0, end: 5)),
    );

    final autoModeBottomBarAnimation = useAnimation(
      thermoModeAUTOController.drive(Tween<double>(begin: 0, end: 75)),
    );

    //COOL
    final thermoModeCOOLController = useAnimationController(
      duration: Duration(milliseconds: 500),
    );
    final coolModeBlurAnimation = useAnimation(
      thermoModeCOOLController.drive(Tween<double>(begin: 0, end: 20)),
    );

    final coolModeShadowAnimation = useAnimation(
      thermoModeCOOLController.drive(Tween<double>(begin: 0, end: 5)),
    );

    final coolModeBottomBarAnimation = useAnimation(
      thermoModeCOOLController.drive(Tween<double>(begin: 100, end: 16)),
    );
    final coolRotateAnimation = useAnimation(
      thermoModeCOOLController.drive(Tween<double>(begin: 0, end: 1)),
    );
    //HOT
    final thermoModeHOTController = useAnimationController(
      duration: Duration(milliseconds: 500),
    );
    final hotModeBlurAnimation = useAnimation(
      thermoModeHOTController.drive(Tween<double>(begin: 0, end: 20)),
    );

    final hotModeShadowAnimation = useAnimation(
      thermoModeHOTController.drive(Tween<double>(begin: 0, end: 5)),
    );

    final hotModeBottomBarAnimation = useAnimation(
      thermoModeHOTController.drive(Tween<double>(begin: 100, end: 16)),
    );
    final hotRotateAnimation = useAnimation(
      thermoModeCOOLController.drive(Tween<double>(begin: 0, end: 1)),
    );
    //TEMP
    final tempController = useAnimationController(
      duration: Duration(milliseconds: 1500),
      initialValue: 0,
      upperBound: 45,
      lowerBound: 15,
    );

    useEffect(() {
      tempController.animateTo(temperature.value);
    }, [temperature.value]);

    useEffect(() {
      thermoModeAUTOController.forward();
    }, []);

    useEffect(() {
      sliderAnimationController.reset();
      sliderAnimationController.forward();
    }, [fanSpeed.value]);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(backgroundColor: AppColors.background),
      body: Padding(
        padding: const EdgeInsets.only(left: 22.0, top: 16, bottom: 16).r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        //  Room Label
                        RoomSelection(),
                        //  Power Switch
                        4.verticalSpace,
                        TempoSwitch(isPowerOn: isPowerOn),

                        50.verticalSpace,

                        // Temperature Display
                        TemperatureDetail(tempController: tempController),

                        50.verticalSpace,

                        ModeSwitcher(
                          autoModeShadowAnimation: autoModeShadowAnimation,
                          thermoMode: thermoMode,
                          thermoModeAUTOController: thermoModeAUTOController,
                          thermoModeCOOLController: thermoModeCOOLController,
                          thermoModeHOTController: thermoModeHOTController,
                          temperature: temperature,
                          autoModeBlurAnimation: autoModeBlurAnimation,
                          autoModeBottomBarAnimation:
                              autoModeBottomBarAnimation,
                          coolModeShadowAnimation: coolModeShadowAnimation,
                          coolModeBlurAnimation: coolModeBlurAnimation,
                          coolModeBottomBarAnimation:
                              coolModeBottomBarAnimation,
                          hotModeShadowAnimation: hotModeShadowAnimation,
                          hotModeBlurAnimation: hotModeBlurAnimation,
                          hotModeBottomBarAnimation: hotModeBottomBarAnimation,
                          coolRotateAnimation: coolRotateAnimation,
                          hotRotateAnimation: hotRotateAnimation,
                        ),
                        40.verticalSpace,
                      ],
                    ),
                  ),

                  Expanded(
                    child: GestureDetector(
                      onVerticalDragUpdate: (details) {
                        if (details.primaryDelta == null) {
                          return;
                        }
                        //down Swipe
                        if (details.primaryDelta! > 0) {
                          if (temperature.value +
                                  (details.primaryDelta! * 0.005) <=
                              tempController.upperBound) {
                            temperature.value +=
                                (details.primaryDelta! * 0.005);
                          } else {
                            temperature.value =
                                tempController
                                    .upperBound; // Ensure it doesn't exceed the max limit
                          }
                        }
                        //up swirpe
                        else if (details.primaryDelta! < 0) {
                          if (temperature.value -
                                  (details.primaryDelta!.abs() * 0.005) >=
                              tempController.lowerBound) {
                            temperature.value -=
                                (details.primaryDelta!.abs() * 0.005);
                          } else {
                            temperature.value =
                                tempController
                                    .lowerBound; // Ensure it doesn't go below the min limit
                          }
                        }
                      },
                      child: Transform.scale(
                        scale: 4.sp,
                        child: Transform.translate(
                          offset: Offset(65.w, -5),
                          child: CustomPaint(
                            isComplex: true,
                            willChange: true,
                            size: Size.fromWidth(100.w),
                            painter: ThermostatArcOuterPainter(),
                            child: Transform.rotate(
                              angle: -((tempController.value) / 30) * pi,
                              child: CustomPaint(
                                isComplex: true,
                                willChange: true,
                                size: Size.fromWidth(100.w),
                                painter: ThermostatArcPainter(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Fan Speed Slider
            FanSpeedSlider(
              sliderFanRotationAnimation: sliderFanRotationAnimation,
              fanSpeed: fanSpeed,
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
