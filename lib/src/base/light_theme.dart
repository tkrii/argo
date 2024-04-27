import 'package:argo/argo.dart'
    show ArgoColorExtension, ArgoColors, ArnaColorsExtension, createArgoTheme;
import 'package:flutter/material.dart';

/// Helper function to create a new Argo light theme
ThemeData createArgoLightTheme({
  required Color primaryColor,
  Color? secondaryColor,
  Color? tertiaryColor,
  Color? elevatedButtonColor,
  Color? elevatedButtonTextColor,
}) {
  container(Color color) => color
      .scale(
        lightness: 0.75,
      )
      .capDown(
        saturation: 0.15,
      );

  final primaryContainer = container(primaryColor);

  final secondary = secondaryColor ??
      primaryColor.scale(
        hue: 1 / 360 * 5,
        lightness: 0.333,
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
    brightness: Brightness.light,

    /// Error colors
    error: ArgoColors.light().error,
    onError: ArgoColors.shade243,

    /// Background color (Scaffold)
    background: ArgoColors.shade243,
    onBackground: ArgoColors.shade32,

    ///TextFieldColor
    ///ButtonColor
    surfaceTint: ArgoColors.shade255,

    ///InverseBackgroundColor
    inverseSurface: ArgoColors.shade32,
    onInverseSurface: ArgoColors.shade243,

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
    surface: ArgoColors.shade251,
    onSurface: ArgoColors.shade32,

    /// SideColor
    /// HeaderColor
    /// ExpansionColor
    surfaceVariant: ArgoColors.shade248,
    onSurfaceVariant: ArgoColors.shade32,

    /// BorderColor
    outline: ArgoColors.shade210,

    ///DisabledColor
    outlineVariant: ArgoColors.shade154,
  );

  return createArgoTheme(
    colorScheme: colorScheme,
    elevatedButtonColor: elevatedButtonColor,
    elevatedButtonTextColor: elevatedButtonTextColor,
  );
}
