import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    appBarTheme:const AppBarTheme(
      color: AppColors.primary,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme:const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
    ),
    textTheme:const TextTheme(
      bodySmall: TextStyle(color: AppColors.textLight),
      bodyMedium: TextStyle(color: Colors.black54),
      headlineSmall: TextStyle(color: AppColors.textLight),
      headlineLarge: TextStyle(color: Colors.black87),
    ),
    iconTheme: const IconThemeData(color: Colors.black87),
    scaffoldBackgroundColor: AppColors.backgroundLight,
    cardColor: Colors.white,
    brightness: Brightness.light,
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    appBarTheme:const  AppBarTheme(
      color: AppColors.primary,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    buttonTheme:const ButtonThemeData(
      buttonColor: AppColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme:const  FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
    ),
    textTheme:const TextTheme(
      bodySmall: TextStyle(color: AppColors.textDark),
      bodyMedium: TextStyle(color: Colors.white70),
      headlineSmall: TextStyle(color: AppColors.textDark),
      headlineLarge: TextStyle(color: Colors.white70),
    ),
    iconTheme:const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: AppColors.backgroundDark,
    cardColor: Colors.black54,
    brightness: Brightness.dark,
  );
}