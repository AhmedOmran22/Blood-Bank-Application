import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Cairo',
  splashFactory: NoSplash.splashFactory,
  snackBarTheme: lightSnackBarTheme,
  brightness: Brightness.light,
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.whiteColor,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryColor,
    surface: const Color(0xfffff6ee),
  ),
  appBarTheme: lightAppBarTheme,
  inputDecorationTheme: lightInputDecorationTheme,
  textButtonTheme:lightTextButtonTheme,
  textTheme: lightTextTheme,
  bottomNavigationBarTheme: lightBottomNavigationBarTheme,
  datePickerTheme: lightDatePickerTheme,
);

TextTheme lightTextTheme = const TextTheme(
  titleLarge: TextStyle(fontSize: 24),
  titleMedium: TextStyle(fontSize: 16),
  displayLarge: TextStyle(fontSize: 28),
  bodyLarge: TextStyle(fontSize: 20),
  bodySmall: TextStyle(fontSize: 14),
);

BottomNavigationBarThemeData lightBottomNavigationBarTheme =
    const BottomNavigationBarThemeData(
  backgroundColor: AppColors.whiteColor,
  selectedItemColor: AppColors.primaryColor,
  unselectedItemColor: AppColors.greyColor,
  type: BottomNavigationBarType.fixed,
);

DatePickerThemeData lightDatePickerTheme = DatePickerThemeData(
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
  yearStyle: const TextStyle(fontSize: 16),
  dayStyle: const TextStyle(fontSize: 16),
  todayBorder: const BorderSide(color: AppColors.primaryColor, width: 2),
  dayOverlayColor:
      WidgetStateProperty.all(AppColors.primaryColor.withAlpha(64)),
);
SnackBarThemeData lightSnackBarTheme = const SnackBarThemeData(
  backgroundColor: AppColors.blackColor,
);
AppBarTheme lightAppBarTheme = const AppBarTheme(
  backgroundColor: AppColors.whiteColor,
  surfaceTintColor: AppColors.whiteColor,
);

InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
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
  floatingLabelStyle: const TextStyle(fontSize: 14),
  hintStyle: const TextStyle(fontSize: 14, color: AppColors.greyColor),
);

TextButtonThemeData lightTextButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        12,
      ),
    ),
    backgroundColor: AppColors.primaryColor,
  ),
);
