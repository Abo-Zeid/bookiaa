import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'DMSerifDisplay',
    scaffoldBackgroundColor: Appcolors.whiteColor,
    appBarTheme:
        AppBarTheme(backgroundColor: Appcolors.whiteColor, centerTitle: true),
    colorScheme: ColorScheme.fromSeed(
        seedColor: Appcolors.primaryColor, onSurface: Appcolors.textColor),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: Appcolors.whiteColor,
      headerForegroundColor: Appcolors.primaryColor,
    ),
    timePickerTheme: TimePickerThemeData(
        backgroundColor: Appcolors.whiteColor,
        dialTextColor: Appcolors.primaryColor,
        dialBackgroundColor: Appcolors.whiteColor,
        hourMinuteColor: Appcolors.whiteColor,
        hourMinuteTextColor: Appcolors.primaryColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Appcolors.backGroundColor,
      elevation: 0,
      unselectedItemColor: Appcolors.darkgreyColor,
      selectedItemColor: Appcolors.primaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Appcolors.acsentColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Appcolors.borderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Appcolors.primaryColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Appcolors.redColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Appcolors.redColor))),
  );
}
