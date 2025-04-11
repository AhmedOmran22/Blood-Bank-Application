import 'package:blood_bank/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: 'Cairo',
  splashFactory: NoSplash.splashFactory,
  snackBarTheme: darkSnackBarTheme,
  brightness: Brightness.dark,
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: const Color(0xFF121212),
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primaryColor,
    surface: Color(0xFF2B2520),
  ),
  appBarTheme: darkAppBarTheme,
  inputDecorationTheme: darkInputDecorationTheme,
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
  textTheme: darkTextTheme,
  bottomNavigationBarTheme: darkBottomNavigationBarTheme,
  datePickerTheme: darkDatePickerTheme,
);

TextTheme darkTextTheme = const TextTheme(
  titleLarge: TextStyle(fontSize: 24),
  titleMedium: TextStyle(fontSize: 16),
  displayLarge: TextStyle(fontSize: 28),
  bodyLarge: TextStyle(fontSize: 20),
  bodySmall: TextStyle(fontSize: 14),
);

BottomNavigationBarThemeData darkBottomNavigationBarTheme =
    const BottomNavigationBarThemeData(
  backgroundColor: Color(0xFF121212),
  selectedItemColor: AppColors.primaryColor,
  unselectedItemColor: AppColors.greyColor,
  type: BottomNavigationBarType.fixed,
);

DatePickerThemeData darkDatePickerTheme = DatePickerThemeData(
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

SnackBarThemeData darkSnackBarTheme = const SnackBarThemeData(
  backgroundColor: AppColors.blackColor,
);
AppBarTheme darkAppBarTheme = const AppBarTheme(
  backgroundColor: Color(0xFF121212),
  surfaceTintColor: Color(0xFF121212),
);

InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
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

TextButtonThemeData darkTextButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        12,
      ),
    ),
    backgroundColor: AppColors.primaryColor,
  ),
);
