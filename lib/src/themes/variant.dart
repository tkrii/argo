import 'package:argo/argo.dart';
import 'package:flutter/material.dart' show ThemeData;

enum ArgoVariant {
  blue(ArgoColors.blue),
  green(ArgoColors.green),
  yellow(ArgoColors.yellow),
  orange(ArgoColors.orange),
  red(ArgoColors.red),
  purple(ArgoColors.purple),
  brown(ArgoColors.brown);

  const ArgoVariant(this.accent);

  final ArgoAccentColor accent;

  ThemeData get themeDark => createArgoDarkTheme(
        accent: accent,
      );

  ThemeData get theme => createArgoLightTheme(
        accent: accent,
      );
}

ThemeData get highContrastDark => createArgoDarkTheme(
      accent: ArgoColors.neutralLight,
      highContrast: true,
    );

ThemeData get highContrastLight => createArgoLightTheme(
      accent: ArgoColors.neutralDark,
      highContrast: true,
    );
