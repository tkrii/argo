import 'package:argo/argo.dart' show ArgoColors;
import 'package:flutter/material.dart' show Brightness, Color, ColorScheme;

/// Argo-specific color scheme extensions.
extension ArgoColorSchemeExtension on ColorScheme {
  /// A color to subtitles or unselected [Icon]/[Text]
  ///
  /// ```dart
  /// Theme.of(context).colorScheme.secondaryText
  /// ```
  ///
  Color get secondaryText => isHighContrast
      ? onBackground
      : isLight
          ? ArgoColors.shade108
          : ArgoColors.shade147;

  /// Whether the brightness is dark.
  bool get isDark => brightness == Brightness.dark;

  /// Whether the brightness is light.
  bool get isLight => brightness == Brightness.light;

  /// Whether the primary color is either black or white.
  bool get isHighContrast => [link].contains(primary);

  /// A color to indicate success e.g. for text input validation.
  ///
  /// ```dart
  /// Theme.of(context).colorScheme.success
  /// ```
  ///
  /// See also:
  ///  * [ColorScheme.success]
  Color get success => ArgoColors.from(brightness).success;

  /// A color to indicate warnings.
  ///
  /// This is the counterpart of [ColorScheme.error].
  ///
  /// ```dart
  /// Theme.of(context).colorScheme.warning
  /// ```
  ///
  /// See also:
  ///  * [ColorScheme.warning]
  Color get warning => ArgoColors.from(brightness).alert;

  /// A color for presenting link.
  ///
  /// ```dart
  /// Theme.of(context).colorScheme.link
  /// ```
  Color get link => ArgoColors.from(brightness).link;
}

extension InverseBrightnessExtension on Brightness {
  Brightness get inverse =>
      this == Brightness.light ? Brightness.dark : Brightness.light;
}

extension ArnaColorsExtension on Color {
  /// Determines whether the given [Color] is [Brightness.light] or [Brightness.dark].
  Brightness get estimateBrightnessForColor {
    final double relativeLuminance = computeLuminance();
    const double kThreshold = 0.098;
    return ((relativeLuminance + 0.05) * (relativeLuminance + 0.05) >
            kThreshold)
        ? Brightness.light
        : Brightness.dark;
  }

  /// A color that's clearly legible when drawn on [backgroundColor].
  Color get onBackgroundColor {
    return estimateBrightnessForColor == Brightness.light
        ? ArgoColors.shade32
        : ArgoColors.shade243;
  }

  /// Applies an overlay color to a [backgroundColor].
  Color get applyOverlay {
    final Color foregroundColor = onBackgroundColor;
    return Color.alphaBlend(
      foregroundColor.withOpacity(0.1),
      this,
    );
  }

  /// The color to use when drawn outside of [color].
  Color get outerColor {
    final double colorLuminance = computeLuminance();
    final Color foregroundColor = colorLuminance < 0.2 || colorLuminance > 0.8
        ? Color.alphaBlend(onBackgroundColor.withOpacity(0.49), this)
        : this;
    return Color.alphaBlend(foregroundColor, this);
  }

  /// Computes the color that matches with [color] and [brightness].
  Color matchingColor(final Brightness brightness) {
    final double colorLuminance = computeLuminance();
    final Color foregroundColor =
        colorLuminance < 0.2 && brightness == Brightness.dark
            ? Color.alphaBlend(onBackgroundColor.withOpacity(0.49), this)
            : colorLuminance > 0.8 && brightness == Brightness.light
                ? Color.alphaBlend(
                    onBackgroundColor.withOpacity(0.28),
                    this,
                  )
                : this;
    return Color.alphaBlend(foregroundColor, this);
  }
}
