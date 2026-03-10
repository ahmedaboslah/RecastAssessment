import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTypography {
  static const String fontFamily = 'SatoshiVariable';

  static TextTheme textTheme(ColorScheme colorScheme) {
    return TextTheme(
      headlineLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 18,
        foreground: Paint()
          ..shader = const LinearGradient(
            colors: [AppColors.titleColor1, AppColors.titleColor2],
          ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
      ),
      headlineSmall: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 9,
        color: AppColors.textSecondary,
      ),
      titleMedium: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 10,
        color: AppColors.textPrimary,
      ),
      titleSmall: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 9,
        color: AppColors.textSecondary,
      ),
      bodyLarge: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: AppColors.textPrimary,
        height: 1.45,
      ),
      bodySmall: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 9,
        color: AppColors.textSecondary,
      ),
          );
  }
}
