import 'package:argo/argo.dart';
import 'package:argo/src/themes/scheme.dart';
import 'package:argo/src/themes/theme_colors.dart';
import 'package:flutter/material.dart';

ThemeData createArgoDarkTheme({
  required ArgoColorTheme theme,
  bool highContrast = false,
}) {
  Color secondaryColor = ArgoColors.slate.shade600;
  Color tertiaryColor = ArgoColors.slate.shade50;
  const Brightness brightness = Brightness.dark;

  Color container(Color color) => color.mix(ArgoColors.white, 66);

  ColorScheme scheme = ColorScheme.fromSwatch(
    primarySwatch: theme.color,
    accentColor: theme.primary(brightness),
    brightness: brightness,
  ).copyWith(
    error: ArgoColors.red.shade500.mix(
      ArgoColors.slate.shade600,
      75,
    ),
    errorContainer: ArgoColors.red.shade500.mix(
      ArgoColors.slate.shade600,
    ),
    primary: theme.primary(brightness),
    onPrimary: theme.primary(brightness).foregroundColor,
    primaryContainer: container(theme.primary(brightness)),
    onPrimaryContainer: container(theme.primary(brightness)).foregroundColor,
    inversePrimary: theme.primary(Brightness.light),

    secondary: secondaryColor,
    onSecondary: secondaryColor.foregroundColor,
    secondaryContainer: container(secondaryColor),
    onSecondaryContainer: container(secondaryColor).foregroundColor,

    tertiary: tertiaryColor,
    onTertiary: tertiaryColor.foregroundColor,
    tertiaryContainer: container(tertiaryColor),
    onTertiaryContainer: container(tertiaryColor).foregroundColor,

    surfaceTint: ArgoColors.black,
    shadow: ArgoColors.slate.shade800,
    // Scaffold color
    surface: ArgoColors.slate.shade950.mix(
      ArgoColors.slate.shade900,
    ),
    onSurface: ArgoColors.zinc.shade200,
    inverseSurface: ArgoColors.white,
    onInverseSurface: ArgoColors.zinc.shade750,
    //Muted outline
    outline: ArgoColors.slate.shade850,
    outlineVariant: ArgoColors.slate.shade450,
    // Card color
    surfaceContainer: ArgoColors.slate.shade900,
    // Alternative background
    // - Use for AppBar, etc...
    surfaceContainerLow: ArgoColors.slate.shade900.mix(
      ArgoColors.slate.shade850,
      75,
    ),
    surfaceContainerLowest: ArgoColors.slate.shade900.mix(
      ArgoColors.slate.shade850,
    ),
  );

  return createArgoTheme(
    colorScheme: scheme,
    colorTheme: theme,
  );
}
