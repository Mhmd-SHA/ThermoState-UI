import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';

class TempoSwitch extends StatelessWidget {
  const TempoSwitch({super.key, required this.isPowerOn});

  final ValueNotifier<bool> isPowerOn;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4).r,
      decoration: BoxDecoration(
        color: AppColors.containerBackground,
        borderRadius: BorderRadius.circular(8).r,
      ),
      child: Switch(
        value: isPowerOn.value,
        onChanged: (val) => isPowerOn.value = val,
        activeColor: AppColors.toggleActive,
        activeTrackColor: AppColors.toggleActive,
        inactiveTrackColor: Colors.transparent,
        thumbColor: WidgetStatePropertyAll(Colors.white),
        inactiveThumbColor: Colors.white,
      ),
    );
  }
}
