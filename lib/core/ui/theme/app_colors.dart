import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const int _seedValue = 0xFF1D74F5;
  static const int _seedDarkValue = 0xFF818CF8;

  static const Color seed = Color(_seedValue);
  static const Color seedDark = Color(_seedDarkValue);
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);

  // Brand accent colors from existing design
  static const Color accent = Color(0xFFD8A48F);
  static const Color accentDark = Color(0xFFC4886F);
}
