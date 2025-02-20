import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';

class RoomSelection extends StatelessWidget {
  const RoomSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      decoration: BoxDecoration(
        color: AppColors.containerBackground,
        borderRadius: BorderRadius.circular(8).r,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          padding: EdgeInsets.all(8).r,
          isExpanded: true,
          items: [
            DropdownMenuItem(
              child: Text(
                "Living Room",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
          onChanged: (value) {},
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 18.sp,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
