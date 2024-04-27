import 'package:flutter/material.dart';

TextTheme createTextTheme(Color textColor) {
  return TextTheme(
    displayLarge: _TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      textColor: textColor,
    ),
    displayMedium: _TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w400,
      textColor: textColor,
    ),
    displaySmall: _TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      textColor: textColor,
    ),
    headlineLarge: _TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    headlineMedium: _TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    headlineSmall: _TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    titleLarge: _TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      textColor: textColor,
    ),
    titleMedium: _TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      textColor: textColor,
    ),
    titleSmall: _TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      textColor: textColor,
    ),
    bodyLarge: _TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    bodyMedium: _TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    bodySmall: _TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    labelLarge: _TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      textColor: textColor,
    ),
    labelMedium: _TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      textColor: textColor,
    ),
    labelSmall: _TextStyle(
      fontSize: 11,
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
          fontFamily: 'FiraSans',
          package: 'argo',
          color: textColor,
        );
}
