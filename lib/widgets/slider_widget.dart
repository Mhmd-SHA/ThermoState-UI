import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thermostate_ui/app_colors.dart';

class FanSpeedSlider extends StatelessWidget {
  const FanSpeedSlider({
    super.key,
    required this.sliderFanRotationAnimation,
    required this.fanSpeed,
  });

  final double sliderFanRotationAnimation;
  final ValueNotifier<double> fanSpeed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4).r,
      margin: EdgeInsets.only(right: 16).r,
      decoration: BoxDecoration(
        color: AppColors.containerBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          4.horizontalSpace,

          Transform.rotate(
            angle: sliderFanRotationAnimation * 6.28 * 0.75,
            child: Icon(
              FontAwesomeIcons.fan,
              color: AppColors.textSecondary,
              size: 16.sp,
            ),
          ),
          Expanded(
            child: Slider(
              value: fanSpeed.value,
              min: 10,
              max: 50,
              onChanged: (value) {
                fanSpeed.value = value;

                print(value);
              },
              activeColor: AppColors.sliderActive,
              inactiveColor: AppColors.sliderInactive,
            ),
          ),
          Transform.rotate(
            angle: sliderFanRotationAnimation * 6.28 * 2.5,
            child: Icon(
              FontAwesomeIcons.fan,
              color: AppColors.textSecondary,
              size: 22.sp,
            ),
          ),
          4.horizontalSpace,
        ],
      ),
    );
  }
}
