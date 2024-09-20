import 'package:flutter/material.dart';

class AppTextStyle {
  static getHeadlineTextStyle(context,
      {double fontSize = 30, fontWeight = FontWeight.normal, Color? color}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? Theme.of(context).colorScheme.onSurface,
    );
  }

  static getTtileTextStyle(BuildContext context,
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
        fontSize: fontSize ?? 20,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? Theme.of(context).colorScheme.onSurface);
  }

  static getbodymTextStyle(BuildContext context,
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Theme.of(context).colorScheme.onSurface);
  }

  static getSmallTextStyle(BuildContext context,
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w100,
        color: color ?? Theme.of(context).colorScheme.onSurface);
  }
}
