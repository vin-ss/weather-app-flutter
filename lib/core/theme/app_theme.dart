import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/colors.dart';

class AppTheme {
  AppTheme._();
  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputBackground,
      hintStyle: const TextStyle(
        color: AppColors.inputHint,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide.none,
      ),
    ),
    fontFamily: 'Josefin Sans',
    primaryColor: const Color(0xff99A0FA),
    textTheme: TextTheme(
      headlineLarge: TextStyle().copyWith(
        color: AppColors.largeText,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle().copyWith(
        color: AppColors.mediumText,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle().copyWith(
        color: AppColors.smallText,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle().copyWith(
        color: AppColors.smallText,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle().copyWith(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle().copyWith(
        color: AppColors.black,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        backgroundColor: AppColors.button,
        foregroundColor: AppColors.white,
        textStyle: TextStyle().copyWith(
          fontFamily: 'Josefin Sans',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
