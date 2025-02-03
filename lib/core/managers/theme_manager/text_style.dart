import 'package:flutter/material.dart';
import 'package:uniqcast_code_challenge/core/managers/theme_manager/app_colors.dart';

extension TextStyleExtension on BuildContext {
  TextStyle get titleTextStyle => const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );

  TextStyle get subtitleTextStyle => const TextStyle(
        color: AppColors.textSecondary,
        fontSize: 16,
      );

  TextStyle get mediumBoldTextStyle => const TextStyle(
        color: AppColors.textSecondary,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );

      TextStyle get lableTextStyle => const TextStyle(
        color: Colors.white,
        fontSize: 15.5,
        fontWeight: FontWeight.w600,
      );
}
