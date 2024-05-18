import 'package:argo/src/themes/styles.dart';
import 'package:flutter/material.dart';

TextTheme createTextTheme(Color textColor) {
  return TextTheme(
    displayLarge: _TextStyle(
      fontSize: 3.5 * rem,
      fontWeight: FontWeight.w400,
      textColor: textColor,
    ),
    displayMedium: _TextStyle(
      fontSize: 2.8125 * rem,
      fontWeight: FontWeight.w400,
      textColor: textColor,
    ),
    displaySmall: _TextStyle(
      fontSize: 2.25 * rem,
      fontWeight: FontWeight.w400,
      textColor: textColor,
    ),
    headlineLarge: _TextStyle(
      fontSize: 2 * rem,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    headlineMedium: _TextStyle(
      fontSize: 1.75 * rem,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    headlineSmall: _TextStyle(
      fontSize: 1.5 * rem,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    titleLarge: _TextStyle(
      fontSize: 1.375 * rem,
      fontWeight: FontWeight.w500,
      textColor: textColor,
    ),
    titleMedium: _TextStyle(
      fontSize: rem,
      fontWeight: FontWeight.w500,
      textColor: textColor,
    ),
    titleSmall: _TextStyle(
      fontSize: 0.875 * rem,
      fontWeight: FontWeight.w500,
      textColor: textColor,
    ),
    bodyLarge: _TextStyle(
      fontSize: rem,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    bodyMedium: _TextStyle(
      fontSize: 0.875 * rem,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    bodySmall: _TextStyle(
      fontSize: 0.75 * rem,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    labelLarge: _TextStyle(
      fontSize: 0.875 * rem,
      fontWeight: FontWeight.w500,
      textColor: textColor,
    ),
    labelMedium: _TextStyle(
      fontSize: 0.75 * rem,
      fontWeight: FontWeight.w500,
      textColor: textColor,
    ),
    labelSmall: _TextStyle(
      fontSize: 0.6875 * rem,
      fontWeight: FontWeight.w500,
      textColor: textColor,
    ),
  );
}

class _TextStyle extends TextStyle {
  final Color textColor;
  const _TextStyle({
    super.fontSize,
    super.fontWeight,
    required this.textColor,
  }) : super(
          fontFamily: 'Inter',
          package: 'argo',
          color: textColor,
        );
}
