import 'package:argo/argo.dart'
    show ArgoColorExtension, ArgoColors, ArnaColorsExtension, createArgoTheme;
import 'package:flutter/material.dart';

/// Helper function to create a new Argo dark theme
ThemeData createArgoDarkTheme({
  required Color primaryColor,
  Color? secondaryColor,
  Color? tertiaryColor,
  Color? elevatedButtonColor,
  Color? elevatedButtonTextColor,
  bool highContrast = false,
}) {
  container(Color color) => color
      .scale(
        lightness: -0.5,
      )
      .cap(
        saturation: 0.1,
      );

  final primaryContainer = container(primaryColor);

  final secondary = secondaryColor ??
      primaryColor.scale(
        hue: 1 / 360 * 15,
        lightness: 0.25,
        saturation: 0.333,
      );

  final secondaryContainer = container(secondary);

  final tertiary = tertiaryColor ??
      secondary.scale(
        hue: 1 / 360 * 180,
      );

  final tertiaryContainer = container(tertiary);

  final colorScheme = ColorScheme.fromSeed(
    /// Base colors
    seedColor: primaryColor,
    brightness: Brightness.dark,

    /// Error colors
    error: ArgoColors.dark().error,
    onError: ArgoColors.shade243,

    /// Background color (Scaffold)
    background: ArgoColors.shade32,
    onBackground: ArgoColors.shade243,

    ///TextFieldColor
    ///ButtonColor
    surfaceTint: ArgoColors.shade57,

    ///InverseBackgroundColor
    inverseSurface: ArgoColors.shade243,
    onInverseSurface: ArgoColors.shade32,

    /// Primary
    primary: primaryColor,
    onPrimary: primaryColor.onBackgroundColor,
    primaryContainer: primaryContainer,
    onPrimaryContainer: primaryContainer.onBackgroundColor,

    /// Secondary
    secondary: secondary,
    onSecondary: secondary.onBackgroundColor,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: secondaryContainer.onBackgroundColor,

    /// Tertiary
    tertiary: tertiary,
    onTertiary: tertiary.onBackgroundColor,
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: tertiaryContainer.onBackgroundColor,

    /// CardColor
    surface: ArgoColors.shade45,
    onSurface: ArgoColors.shade243,

    /// SideColor
    /// HeaderColor
    /// ExpansionColor
    surfaceVariant: ArgoColors.shade37,
    onSurfaceVariant: ArgoColors.shade243,

    /// BorderColor
    outline: ArgoColors.shade07,

    ///DisabledColor
    outlineVariant: ArgoColors.shade101,
  );

  return createArgoTheme(
    colorScheme: colorScheme,
    elevatedButtonColor: elevatedButtonColor,
    elevatedButtonTextColor: elevatedButtonTextColor,
  );
}
