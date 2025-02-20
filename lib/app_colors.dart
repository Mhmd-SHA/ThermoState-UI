import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  // Background Colors
  static const Color background = Color.fromRGBO(2, 2, 2, 1);
  static const Color containerBackground = Color.fromRGBO(31, 33, 33, 1);

  // Text Colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.grey;

  // Temperature Indicator Colors
  static const Color coolBlue = Color(0xFF00A8FF); // Blue for cooling
  static const Color warmYellow = Color(0xFFFFD700); // Yellow for heating

  // Button Colors
  static const Color buttonActive = Color(0xFF00A8FF);
  static const Color buttonInactive = Colors.grey;

  // Toggle Switch Colors
  static const Color toggleActive = Color.fromRGBO(35, 254, 254, 1);
  static const Color toggleInactive = Colors.grey;

  // Slider Colors
  static const Color sliderActive = Color(0xFF00A8FF);
  static const Color sliderInactive = Colors.grey;
}
