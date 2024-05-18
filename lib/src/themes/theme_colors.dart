import 'package:argo/argo.dart';
import 'package:flutter/material.dart';

typedef Base = Map<String, Color>;
typedef ColorThemeBase = Map<Brightness, Base>;

class ArgoColorTheme {
  final ColorThemeBase theme;
  final MaterialColor color;

  ArgoColorTheme._(this.color, this.theme);

  factory ArgoColorTheme.fromArgoColor(MaterialColor color) {
    switch (color) {
      case ArgoColors.amber:
        return ArgoColorTheme._(
          color,
          {
            Brightness.dark: {
              'text-selection-color': color.scale(alpha: -0.8125),
              'primary': color.shade350,
              'primary-background': color.shade200,
              'primary-underline': color.shade350.scale(alpha: -0.25),
              'primary-hover': color.shade250,
              'primary-hover-background': color.shade150,
              'primary-focus': color.shade350.scale(alpha: -0.625),
              'primary-inverse': ArgoColors.black,
            },
            Brightness.light: {
              'text-selection-color': color.shade400.scale(alpha: -0.25),
              'primary': color.shade550,
              'primary-background': color.shade200,
              'primary-underline': color.shade550.scale(alpha: -0.5),
              'primary-hover': color.shade650,
              'primary-hover-background': color.shade250,
              'primary-focus': color.shade400.scale(alpha: -0.5),
              'primary-inverse': ArgoColors.black
            },
          },
        );
      case ArgoColors.green:
      case ArgoColors.pink:
        return ArgoColorTheme._(
          color,
          {
            Brightness.dark: {
              'text-selection-color': color.shade350.scale(alpha: -0.8125),
              'primary': color.shade350,
              'primary-background': color.shade500,
              'primary-underline': color.shade350.scale(alpha: -0.5),
              'primary-hover': color.shade250,
              'primary-hover-background': color.shade450,
              'primary-focus': color.shade350.scale(alpha: 1 - .375),
              'primary-inverse': ArgoColors.white
            },
            Brightness.light: {
              'text-selection-color': color.shade400.scale(alpha: -0.25),
              'primary': color.shade550,
              'primary-background': color.shade500,
              'primary-underline': color.shade550.scale(alpha: -0.5),
              'primary-hover': color.shade650,
              'primary-hover-background': color.shade550,
              'primary-focus': color.shade400.scale(alpha: -0.5),
              'primary-inverse': ArgoColors.white
            },
          },
        );
      case ArgoColors.grey:
      case ArgoColors.pumpkin:
        return ArgoColorTheme._(
          color,
          {
            Brightness.dark: {
              'text-selection-color': color.shade350.scale(alpha: -0.8125),
              'primary': color.shade350,
              'primary-background': color.shade300,
              'primary-underline': color.shade350.scale(alpha: -0.5),
              'primary-hover': color.shade250,
              'primary-hover-background': color.shade250,
              'primary-focus': color.shade350.scale(alpha: 1 - .375),
              'primary-inverse': ArgoColors.black
            },
            Brightness.light: {
              'text-selection-color': color.shade400.scale(alpha: -0.25),
              'primary': color.shade550,
              'primary-background': color.shade300,
              'primary-underline': color.shade550.scale(alpha: -0.5),
              'primary-hover': color.shade650,
              'primary-hover-background': color.shade350,
              'primary-focus': color.shade400.scale(alpha: -0.5),
              'primary-inverse': ArgoColors.black
            },
          },
        );
      case ArgoColors.indigo:
      case ArgoColors.purple:
      case ArgoColors.slate:
      case ArgoColors.violet:
        return ArgoColorTheme._(
          color,
          {
            Brightness.dark: {
              'text-selection-color': color.shade350.scale(alpha: -0.8125),
              'primary': color.shade350,
              'primary-background': color.shade600,
              'primary-underline': color.shade350.scale(alpha: -0.5),
              'primary-hover': color.shade250,
              'primary-hover-background': color.shade550,
              'primary-focus': color.shade350.scale(alpha: 1 - .375),
              'primary-inverse': ArgoColors.white
            },
            Brightness.light: {
              'text-selection-color': color.shade400.scale(alpha: -0.25),
              'primary': color.shade550,
              'primary-background': color.shade600,
              'primary-underline': color.shade550.scale(alpha: -0.5),
              'primary-hover': color.shade650,
              'primary-hover-background': color.shade650,
              'primary-focus': color.shade400.scale(alpha: -0.5),
              'primary-inverse': ArgoColors.white
            },
          },
        );
      case ArgoColors.lime:
      case ArgoColors.sand:
        return ArgoColorTheme._(
          color,
          {
            Brightness.dark: {
              'text-selection-color': color.shade350.scale(alpha: -0.8125),
              'primary': color.shade350,
              'primary-background': color.shade200,
              'primary-underline': color.shade350.scale(alpha: -0.5),
              'primary-hover': color.shade250,
              'primary-hover-background': color.shade150,
              'primary-focus': color.shade350.scale(alpha: 1 - .375),
              'primary-inverse': ArgoColors.black
            },
            Brightness.light: {
              'text-selection-color': color.shade400.scale(alpha: -0.25),
              'primary': color.shade550,
              'primary-background': color.shade200,
              'primary-underline': color.shade550.scale(alpha: -0.5),
              'primary-hover': color.shade650,
              'primary-hover-background': color.shade250,
              'primary-focus': color.shade400.scale(alpha: -0.5),
              'primary-inverse': ArgoColors.black
            },
          },
        );
      case ArgoColors.yellow:
        return ArgoColorTheme._(
          color,
          {
            Brightness.dark: {
              'text-selection-color': color.shade350.scale(alpha: -0.8125),
              'primary': color.shade350,
              'primary-background': color.shade100,
              'primary-underline': color.shade350.scale(alpha: -0.5),
              'primary-hover': color.shade250,
              'primary-hover-background': color.shade100.mix(color.shade50),
              'primary-focus': color.shade350.scale(alpha: 1 - .375),
              'primary-inverse': ArgoColors.black
            },
            Brightness.light: {
              'text-selection-color': color.shade400.scale(alpha: -0.25),
              'primary': color.shade550,
              'primary-background': color.shade100,
              'primary-underline': color.shade550.scale(alpha: -0.5),
              'primary-hover': color.shade650,
              'primary-hover-background': color.shade150,
              'primary-focus': color.shade400.scale(alpha: -0.5),
              'primary-inverse': ArgoColors.black
            },
          },
        );
      case ArgoColors.azure:
      case ArgoColors.blue:
      case ArgoColors.cyan:
      case ArgoColors.fuchsia:
      case ArgoColors.jade:
      case ArgoColors.orange:
      case ArgoColors.red:
      case ArgoColors.zinc:
      default:
        return ArgoColorTheme._(
          color,
          {
            Brightness.dark: {
              'text-selection-color': color.shade350.scale(alpha: -0.8125),
              'primary': color.shade350,
              'primary-background': color.shade550,
              'primary-underline': color.shade350.scale(alpha: -0.25),
              'primary-hover': color.shade250,
              'primary-hover-background': color.shade500,
              'primary-focus': color.shade350.scale(alpha: -0.625),
              'primary-inverse': ArgoColors.white,
            },
            Brightness.light: {
              'text-selection-color': color.shade400.scale(alpha: -0.75),
              'primary': color.shade550,
              'primary-background': color.shade550,
              'primary-underline': color.shade550.scale(alpha: -0.25),
              'primary-hover': color.shade650,
              'primary-hover-background': color.shade600,
              'primary-focus': color.shade400.scale(alpha: -0.25),
              'primary-inverse': ArgoColors.white,
            }
          },
        );
    }
  }

  Base _base(Brightness brightness) => theme[brightness]!;

  Color textSelectionColor(Brightness brightness) => _base(brightness)['text-selection-color']!;

  Color primary(Brightness brightness) => _base(brightness)['primary']!;

  Color primaryBackground(Brightness brightness) => _base(brightness)['primary-background']!;

  Color primaryUnderline(Brightness brightness) => _base(brightness)['primary-underline']!;

  Color primaryHover(Brightness brightness) => _base(brightness)['primary-hover']!;

  Color primaryHoverBackground(Brightness brightness) => _base(brightness)['primary-hover-background']!;

  Color primaryFocus(Brightness brightness) => _base(brightness)['primary-focus']!;

  Color primaryInverse(Brightness brightness) => _base(brightness)['primary-inverse']!;
}
