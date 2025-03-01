import 'package:african_countries_search/utils/constants/app_colours.dart';
import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: AppColours.black,
    
    checkboxTheme: const CheckboxThemeData(
      fillColor: WidgetStatePropertyAll(AppColours.black,),
      checkColor: WidgetStatePropertyAll(AppColours.white,),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColours.grey3
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColours.white,
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(AppColours.black,),
    ),
    scaffoldBackgroundColor: AppColours.white,
    textTheme: TextThemes.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: AppColours.white,
    checkboxTheme: const CheckboxThemeData(
      fillColor: WidgetStatePropertyAll(AppColours.white,),
      checkColor: WidgetStatePropertyAll(AppColours.black,),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColours.grey2
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColours.black,
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(AppColours.white,),
    ),
    scaffoldBackgroundColor: AppColours.black,
    textTheme: TextThemes.darkTextTheme,
  );
}

class TextThemes {
  TextThemes._();

  static TextTheme lightTextTheme = const TextTheme(
    displayLarge: TextStyle(color: AppColours.black),
    displayMedium: TextStyle(color: AppColours.black),
    displaySmall: TextStyle(color: AppColours.black),
    headlineLarge: TextStyle(color: AppColours.black),
    headlineMedium: TextStyle(color: AppColours.black),
    headlineSmall: TextStyle(color: AppColours.black),
    titleLarge: TextStyle(color: AppColours.black),
    titleMedium: TextStyle(color: AppColours.black),
    titleSmall: TextStyle(color: AppColours.black),
    bodyLarge: TextStyle(color: AppColours.black),
    bodyMedium: TextStyle(color: AppColours.black),
    bodySmall: TextStyle(color: AppColours.black),
    labelLarge: TextStyle(color: AppColours.black),
    labelMedium: TextStyle(color: AppColours.black),
    labelSmall: TextStyle(color: AppColours.black),
  );

  static TextTheme darkTextTheme = const TextTheme(
    displayLarge: TextStyle(color: AppColours.white),
    displayMedium: TextStyle(color: AppColours.white),
    displaySmall: TextStyle(color: AppColours.white),
    headlineLarge: TextStyle(color: AppColours.white),
    headlineMedium: TextStyle(color: AppColours.white),
    headlineSmall: TextStyle(color: AppColours.white),
    titleLarge: TextStyle(color: AppColours.white),
    titleMedium: TextStyle(color: AppColours.white),
    titleSmall: TextStyle(color: AppColours.white),
    bodyLarge: TextStyle(color: AppColours.white),
    bodyMedium: TextStyle(color: AppColours.white),
    bodySmall: TextStyle(color: AppColours.white),
    labelLarge: TextStyle(color: AppColours.white),
    labelMedium: TextStyle(color: AppColours.white),
    labelSmall: TextStyle(color: AppColours.white),
  );
}
