import 'package:argo/argo.dart';
import 'package:argo/src/themes/scheme.dart';
import 'package:argo/src/themes/theme_colors.dart';
import 'package:flutter/material.dart';

ThemeData createArgoLightTheme({
  required ArgoColorTheme theme,
  bool highContrast = false,
}) {
  Color secondaryColor = ArgoColors.slate.shade600;
  Color tertiaryColor = ArgoColors.slate.shade900;
  const Brightness brightness = Brightness.light;

  Color container(Color color) => color.mix(ArgoColors.black, 66);

  ColorScheme scheme = ColorScheme.fromSwatch(
    primarySwatch: theme.color,
    accentColor: theme.primary(brightness),
    brightness: brightness,
  ).copyWith(
    error: ArgoColors.red.shade500.mix(
      ArgoColors.zinc.shade350,
      75,
    ),
    errorContainer: ArgoColors.red.shade500.mix(
      ArgoColors.zinc.shade350,
    ),
    primary: theme.primary(brightness),
    onPrimary: theme.primary(brightness).foregroundColor,
    primaryContainer: container(theme.primary(brightness)),
    onPrimaryContainer: container(theme.primary(brightness)).foregroundColor,
    inversePrimary: theme.primary(Brightness.dark),

    secondary: secondaryColor,
    onSecondary: secondaryColor.foregroundColor,
    secondaryContainer: container(secondaryColor),
    onSecondaryContainer: container(secondaryColor).foregroundColor,

    tertiary: tertiaryColor,
    onTertiary: tertiaryColor.foregroundColor,
    tertiaryContainer: container(tertiaryColor),
    onTertiaryContainer: container(tertiaryColor).foregroundColor,

    surfaceTint: ArgoColors.white,
    shadow: ArgoColors.slate.shade400,
    // Scaffold color
    surface: ArgoColors.white,
    onSurface: ArgoColors.zinc.shade750,
    inverseSurface: ArgoColors.slate.shade950.mix(
      ArgoColors.slate.shade900,
    ),
    onInverseSurface: ArgoColors.zinc.shade200,
    // Muted outline
    outline: ArgoColors.slate.shade100.mix(
      ArgoColors.slate.shade50,
    ),
    outlineVariant: ArgoColors.zinc.shade550,
    // Card color
    surfaceContainer: ArgoColors.white,

    // Alternative background
    // - Use for AppBar, etc...
    surfaceContainerLow: ArgoColors.slate.shade50.mix(
      ArgoColors.white,
      25,
    ),
    surfaceContainerLowest: ArgoColors.slate.shade50.mix(
      ArgoColors.white,
      25,
    ),
  );
  return createArgoTheme(
    colorScheme: scheme,
    colorTheme: theme,
  );
}
