import 'package:argo/argo.dart'
    show ArgoColors, ArnaColorsExtension, createArgoTheme;
import 'package:flutter/material.dart'
    show Brightness, ColorScheme, ThemeData, Color, VisualDensity;

ThemeData _argoHighContrast(Brightness brightness) {
  Color color = ArgoColors.from(brightness).link;
  Color background =
      brightness == Brightness.light ? ArgoColors.shade255 : ArgoColors.shade00;
  Color decoration =
      brightness == Brightness.light ? ArgoColors.shade00 : ArgoColors.shade255;

  final colorScheme = ColorScheme.fromSeed(
    /// Base colors
    seedColor: color,
    brightness: brightness,

    /// Error colors
    error: ArgoColors.from(brightness).error,
    onError: ArgoColors.shade243,

    /// Background color (Scaffold)
    background: background,
    onBackground: decoration,

    ///TextFieldColor
    ///ButtonColor
    surfaceTint: background,

    ///InverseBackgroundColor
    inverseSurface: decoration,
    onInverseSurface: background,

    /// Primary
    primary: color,
    onPrimary: color.onBackgroundColor,
    primaryContainer: background,
    onPrimaryContainer: decoration,

    /// Secondary
    secondary: color,
    onSecondary: color.onBackgroundColor,
    secondaryContainer: background,
    onSecondaryContainer: decoration,

    /// Tertiary
    tertiary: color,
    onTertiary: color.onBackgroundColor,
    tertiaryContainer: background,
    onTertiaryContainer: decoration,

    /// CardColor
    surface: background,
    onSurface: decoration,

    /// SideColor
    /// HeaderColor
    /// ExpansionColor
    surfaceVariant: background,
    onSurfaceVariant: decoration,

    /// BorderColor
    outline: decoration,

    ///DisabledColor
    outlineVariant: decoration.withOpacity(0.5),
  );

  return createArgoTheme(
    colorScheme: colorScheme,
  ).copyWith(
    visualDensity: VisualDensity.comfortable,
  );
}

ThemeData get argoHighContrastDark => _argoHighContrast(Brightness.dark);

ThemeData get argoHighContrastLight => _argoHighContrast(Brightness.light);
