import 'package:argo/argo.dart';
import 'package:argo/src/themes/scheme_theme.dart';
import 'package:flutter/material.dart';

createArgoLightTheme({
  required ArgoAccentColor accent,
  bool highContrast = false,
  Color? secondary,
  Color? tertiary,
}) {
  Brightness brightness = Brightness.light;

  secondary ??= accent.shade2;
  tertiary ??= accent.shade1;

  Color container(Color color) => color.mix(ArgoColors.white, 66);

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
    error: ArgoColors.light().destructive,
    onError: ArgoColors.light().destructive.foreground,

    /// window color to [Scaffold]
    surface: const Color(0xfffafafa).applyHighContrast(highContrast),
    onSurface: const Color(0xff323232),

    /// in light: white, in dark: black
    surfaceBright: ArgoColors.white,
    surfaceTint: ArgoColors.white,

    /// inverse color of window
    inverseSurface: const Color(0xff242424).applyHighContrast(highContrast),
    onInverseSurface: ArgoColors.white,

    /// thumbnail color to [Card]
    surfaceContainer: const Color(0xffffffff).applyHighContrast(highContrast),

    /// view color to [Button] and [TextField]
    surfaceContainerHighest:
        const Color(0xffffffff).applyHighContrast(highContrast),

    /// headerbar color to [AppBar]
    surfaceContainerHigh:
        const Color(0xffffffff).applyHighContrast(highContrast),

    /// secondary sidebar color to selected **Items**
    surfaceContainerLow:
        const Color(0xfff3f3f3).applyHighContrast(highContrast),

    /// sidebar color to **Items** container (Navigation bars)
    surfaceContainerLowest:
        const Color(0xffebebeb).applyHighContrast(highContrast),

    /// header bar shade color, used for decorations
    outline: const Color(0xff000000).scale(alpha: -0.88),

    /// divider color
    outlineVariant:
        ArgoColors.white.foreground.scale(alpha: highContrast ? -0.5 : -0.85),
  );

  return createArgoTheme(scheme);
}
