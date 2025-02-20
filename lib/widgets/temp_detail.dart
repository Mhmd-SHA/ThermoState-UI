import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thermostate_ui/app_colors.dart';

class TemperatureDetail extends StatelessWidget {
  const TemperatureDetail({super.key, required this.tempController});

  final AnimationController tempController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "°C",
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 16.sp,
            height: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          tempController.value.toStringAsFixed(1),
          style: TextStyle(
            fontSize: 75.sp,
            height: 1,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        Row(
          children: [
            Icon(Icons.water, size: 15.sp, color: AppColors.textSecondary),
            4.verticalSpace,
            Text(
              "56%",
              style: TextStyle(
                fontSize: 15.sp,
                height: 1,
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
