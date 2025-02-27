import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

ThemeData lightTheme = ThemeData(
  splashFactory: NoSplash.splashFactory,
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: AppColors.whiteColor,
  ),
  brightness: Brightness.light,
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.whiteColor,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryColor,
    surface: const Color(0xfffff6ee),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.whiteColor,
    surfaceTintColor: AppColors.whiteColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.greyColor.withAlpha(128)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppColors.primaryColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.greyColor.withAlpha(128)),
    ),
    floatingLabelStyle: AppStyles.cairoRegular14,
    hintStyle: AppStyles.cairoRegular14.copyWith(color: AppColors.greyColor),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      backgroundColor: AppColors.primaryColor,
    ),
  ),
  textTheme: TextTheme(
    titleLarge: AppStyles.cairoBold24.copyWith(color: AppColors.blackColor),
    titleMedium: AppStyles.cairoRegular16.copyWith(
      color: AppColors.blackColor,
      fontWeight: FontWeight.w900,
    ),
    displayLarge: AppStyles.cairoBold28.copyWith(color: AppColors.blackColor),
    bodyLarge: AppStyles.cairoBold20.copyWith(color: AppColors.blackColor),
    bodySmall: AppStyles.cairoRegular14.copyWith(color: AppColors.blackColor),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.whiteColor,
    selectedItemColor: AppColors.primaryColor,
  ),
  datePickerTheme: DatePickerThemeData(
    cancelButtonStyle: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
      foregroundColor: WidgetStateProperty.all(AppColors.blackColor),
    ),
    confirmButtonStyle: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
      foregroundColor: WidgetStateProperty.all(AppColors.blackColor),
    ),
    // backgroundColor: const Color(0xFF2B2520),
    headerBackgroundColor: AppColors.primaryColor,
    // headerForegroundColor: AppColors.whiteColor,
    surfaceTintColor: const Color(0xFF2B2520),
    yearStyle: AppStyles.cairoRegular16.copyWith(color: AppColors.blackColor),
    dayStyle: AppStyles.cairoRegular16.copyWith(color: AppColors.blackColor),
    todayBorder: const BorderSide(color: AppColors.primaryColor, width: 2),
    dayOverlayColor:
        WidgetStateProperty.all(AppColors.primaryColor.withAlpha(64)),
   
  ),
);
