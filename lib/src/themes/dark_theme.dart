import 'package:argo/argo.dart';
import 'package:argo/src/themes/scheme_theme.dart';
import 'package:flutter/material.dart';

ThemeData createArgoDarkTheme({
  required ArgoAccentColor accent,
  bool highContrast = false,
  Color? secondary,
  Color? tertiary,
}) {
  Brightness brightness = Brightness.dark;
  secondary ??= accent.shade4;
  tertiary ??= accent.shade5;

  Color container(Color color) =>
      const Color(0xff242424).applyHighContrast(highContrast).mix(color, 75);

  ColorScheme scheme = ColorScheme(
    /// brightness
    brightness: brightness,

    /// colors
    primary: accent,
    inversePrimary: accent,
    onPrimary: accent.foreground,
    secondary: secondary,
    onSecondary: secondary.foreground,
    tertiary: tertiary,
    onTertiary: tertiary.foreground,

    /// containers
    primaryContainer: container(accent),
    onPrimaryContainer: container(accent).foreground,
    secondaryContainer: container(secondary),
    onSecondaryContainer: container(secondary).foreground,
    tertiaryContainer: container(tertiary),
    onTertiaryContainer: container(tertiary).foreground,

    /// error
    error: ArgoColors.dark().destructive,
    onError: ArgoColors.dark().destructive.foreground,

    /// window color to [Scaffold]
    surface: const Color(0xff242424).applyHighContrast(highContrast),
    onSurface: const Color(0xffffffff),

    /// in light: white, in dark: black
    surfaceBright: ArgoColors.black,
    surfaceTint: ArgoColors.black,

    /// inverse color of window
    inverseSurface: const Color(0xffffffff).applyHighContrast(highContrast),
    onInverseSurface: const Color(0xff000000).withOpacity(0.8),

    /// thumbnail color to [Card]
    surfaceContainer: const Color(0xff303030).mix(const Color(0xff383838)),

    /// view color to [Button] and [TextField]
    surfaceContainerHighest:
        const Color(0xff1e1e1e).applyHighContrast(highContrast),

    /// headerBar color to [AppBar]
    surfaceContainerHigh:
        const Color(0xff303030).applyHighContrast(highContrast),

    /// secondary sidebar color to selected **Items**
    surfaceContainerLow:
        const Color(0xff2a2a2a).applyHighContrast(highContrast),

    /// sidebar color to **Items** container (Navigation bars)
    surfaceContainerLowest:
        const Color(0xff383838).applyHighContrast(highContrast),

    /// header bar shade color, used for decorations
    outline: const Color(0xff000000).scale(alpha: -0.64),

    /// divider color
    outlineVariant:
        ArgoColors.black.foreground.scale(alpha: highContrast ? -0.5 : -0.85),
  );

  return createArgoTheme(scheme);
}
