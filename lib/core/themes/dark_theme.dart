import 'package:blood_bank/core/utils/app_colors.dart';
import 'package:blood_bank/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  splashFactory: NoSplash.splashFactory,
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: AppColors.blackColor,
  ),
  brightness: Brightness.dark,
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: const Color(0xFF121212),
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primaryColor,
    surface: Color(0xFF2B2520),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF121212),
    surfaceTintColor: Color(0xFF121212),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: const Color(0xFF121212),
    filled: true,
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
    floatingLabelStyle: AppStyles.cairoRegular14.copyWith(color: Colors.white),
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
    titleLarge: AppStyles.cairoBold24.copyWith(color: AppColors.whiteColor),
    titleMedium: AppStyles.cairoRegular16.copyWith(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w900,
    ),
    displayLarge: AppStyles.cairoBold28.copyWith(color: AppColors.whiteColor),
    bodyLarge: AppStyles.cairoBold20.copyWith(color: AppColors.whiteColor),
    bodySmall: AppStyles.cairoRegular14.copyWith(color: AppColors.whiteColor),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF121212),
    selectedItemColor: AppColors.primaryColor,
    unselectedItemColor: AppColors.greyColor,
    type: BottomNavigationBarType.fixed,
  ),
  datePickerTheme: DatePickerThemeData(
    cancelButtonStyle: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
      foregroundColor: WidgetStateProperty.all(AppColors.whiteColor),
    ),
    confirmButtonStyle: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
      foregroundColor: WidgetStateProperty.all(AppColors.whiteColor),
    ),
    backgroundColor: const Color(0xFF2B2520),
    headerBackgroundColor: AppColors.primaryColor,
    headerForegroundColor: AppColors.whiteColor,
    surfaceTintColor: const Color(0xFF2B2520),
    yearStyle: AppStyles.cairoRegular16.copyWith(color: AppColors.whiteColor),
    dayStyle: AppStyles.cairoRegular16.copyWith(color: AppColors.whiteColor),
    todayBorder: const BorderSide(color: AppColors.primaryColor, width: 2),
    dayOverlayColor:
        WidgetStateProperty.all(AppColors.primaryColor.withAlpha(64)),
  ),
);
