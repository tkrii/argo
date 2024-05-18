import 'package:argo/argo.dart';
import 'package:flutter/material.dart' show Brightness, Color, ColorScheme, ColorSwatch, HSLColor;

extension BrightnessInverse on Brightness {
  Brightness get inverse => this == Brightness.light ? Brightness.dark : Brightness.light;
}

extension Utils on Color {
  /// Calculate color int brightness
  /// Color brightness is determinate by the following formula:
  /// ((Red value X 299) + (Green value X 587) + (Blue value X 114)) / 1000
  int get _brightnessValue => (((red * 299) + (green * 587) + (blue * 114)) / 1000).round();

  Brightness get brightness =>
      (_brightnessValue) >= (ArgoColors.white._brightnessValue / 2) ? Brightness.light : Brightness.dark;

  Color get foregroundColor => brightness == Brightness.dark ? ArgoColors.zinc.shade200 : ArgoColors.zinc.shade750;
  Color get foregroundBrightColor => brightness == Brightness.dark ? ArgoColors.white : ArgoColors.black;

  ///Sass mix() colors
  Color mix(Color other, [int weight = 50]) {
    assert(weight >= 0 && weight <= 100);
    int weightDifference = 100 - weight;
    int newRed = ((red * weight / 100) + (other.red * weightDifference / 100)).round();
    int newGreen = ((green * weight / 100) + (other.green * weightDifference / 100)).round();
    int newBlue = ((blue * weight / 100) + (other.blue * weightDifference / 100)).round();
    int newAlpha = ((alpha * weight / 100) + (other.alpha * weightDifference / 100)).round();
    return Color.fromARGB(newAlpha, newRed, newGreen, newBlue);
  }
}

extension AsMaterialColor on ColorSwatch<int> {
  Color get shade50 => this[50]!;
  Color get shade100 => this[100]!;
  Color get shade150 => this[150]!;
  Color get shade200 => this[200]!;
  Color get shade250 => this[250]!;
  Color get shade300 => this[300]!;
  Color get shade350 => this[350]!;
  Color get shade400 => this[400]!;
  Color get shade450 => this[450]!;
  Color get shade500 => this[500]!;
  Color get shade550 => this[550]!;
  Color get shade600 => this[600]!;
  Color get shade650 => this[650]!;
  Color get shade700 => this[700]!;
  Color get shade750 => this[750]!;
  Color get shade800 => this[800]!;
  Color get shade850 => this[850]!;
  Color get shade900 => this[900]!;
  Color get shade950 => this[950]!;
}

/// Argo-specific color scheme extensions.
extension ArgoColorSchemeExtension on ColorScheme {
  /// A color to subtitles or unselected [Icon]/[Text]
  ///
  /// ```dart
  /// Theme.of(context).colorScheme.secondaryText
  /// ```
  ///
  Color get muted => isDark ? ArgoColors.zinc.shade550 : ArgoColors.zinc.shade450;

  /// Whether the brightness is dark.
  bool get isDark => brightness == Brightness.dark;

  /// Whether the brightness is light.
  bool get isLight => brightness == Brightness.light;
}

/// Set of useful methodColor.fromARGB(255, 117, 115, 123)th [Color]
extension ArgoColorExtension on Color {
  /// Scale color attributes relatively to current ones.
  /// [alpha], [hue], [saturation] and [lightness] values must be clamped between -1.0 and 1.0
  Color scale({
    double alpha = 0.0,
    double hue = 0.0,
    double saturation = 0.0,
    double lightness = 0.0,
  }) {
    assert(alpha >= -1.0 && alpha <= 1.0);
    assert(hue >= -1.0 && hue <= 1.0);
    assert(saturation >= -1.0 && saturation <= 1.0);
    assert(lightness >= -1.0 && lightness <= 1.0);

    final hslColor = _getPatchedHslColor();

    double scale(double value, double amount, [double upperLimit = 1.0]) {
      var result = value;

      if (amount > 0) {
        result = value + (upperLimit - value) * amount;
      } else if (amount < 0) {
        result = value + value * amount;
      }

      return result.clamp(0.0, upperLimit);
    }

    return hslColor
        .withAlpha(scale(opacity, alpha))
        .withHue(scale(hslColor.hue, hue, 360.0))
        .withSaturation(scale(hslColor.saturation, saturation))
        .withLightness(scale(hslColor.lightness, lightness))
        .toColor();
  }

  /// Adjust color attributes by the given values.
  /// [alpha], [saturation] and [lightness] values must be clamped between -1.0 and 1.0
  /// [hue] value must be clamped between -360.0 and 360.0
  Color adjust({
    double alpha = 0.0,
    double hue = 0.0,
    double saturation = 0.0,
    double lightness = 0.0,
  }) {
    assert(alpha >= -1.0 && alpha <= 1.0);
    assert(hue >= -360.0 && hue <= 360.0);
    assert(saturation >= -1.0 && saturation <= 1.0);
    assert(lightness >= -1.0 && lightness <= 1.0);

    final hslColor = _getPatchedHslColor();

    double adjust(double value, double amount, [double upperLimit = 1.0]) {
      return (value + amount).clamp(0.0, upperLimit);
    }

    return hslColor
        .withAlpha(adjust(hslColor.alpha, alpha))
        .withHue(adjust(hslColor.hue, hue, 360.0))
        .withSaturation(adjust(hslColor.saturation, saturation))
        .withLightness(adjust(hslColor.lightness, lightness))
        .toColor();
  }

  /// Return a copy of this color with attributes replaced by given values.
  /// [alpha], [saturation] and [lightness] values must be clamped between 0.0 and 1.0
  /// [hue] value must be clamped between 0.0 and 360.0
  Color copyWith({
    double? alpha,
    double? hue,
    double? saturation,
    double? lightness,
  }) {
    assert(alpha == null || (alpha >= 0.0 && alpha <= 1.0));
    assert(hue == null || (hue >= 0.0 && hue <= 360.0));
    assert(saturation == null || (saturation >= 0.0 && saturation <= 1.0));
    assert(lightness == null || (lightness >= 0.0 && lightness <= 1.0));

    final hslColor = _getPatchedHslColor();

    return hslColor
        .withAlpha(alpha ?? hslColor.alpha)
        .withHue(hue ?? hslColor.hue)
        .withSaturation(saturation ?? hslColor.saturation)
        .withLightness(lightness ?? hslColor.lightness)
        .toColor();
  }

  Color cap({
    double alpha = 1.0,
    double saturation = 1.0,
    double lightness = 1.0,
  }) {
    assert(alpha >= 0.0 && alpha <= 1.0);
    assert(saturation >= 0.0 && saturation <= 1.0);
    assert(lightness >= 0.0 && lightness <= 1.0);

    final hslColor = _getPatchedHslColor();

    return hslColor
        .withAlpha(hslColor.alpha <= alpha ? hslColor.alpha : alpha)
        .withSaturation(
          hslColor.saturation <= saturation ? hslColor.saturation : saturation,
        )
        .withLightness(
          hslColor.lightness <= lightness ? hslColor.lightness : lightness,
        )
        .toColor();
  }

  Color capDown({
    double alpha = 0.0,
    double saturation = 0.0,
    double lightness = 0.0,
  }) {
    assert(alpha >= 0.0 && alpha <= 1.0);
    assert(saturation >= 0.0 && saturation <= 1.0);
    assert(lightness >= 0.0 && lightness <= 1.0);

    final hslColor = _getPatchedHslColor();

    return hslColor
        .withAlpha(hslColor.alpha >= alpha ? hslColor.alpha : alpha)
        .withSaturation(
          hslColor.saturation >= saturation ? hslColor.saturation : saturation,
        )
        .withLightness(
          hslColor.lightness >= lightness ? hslColor.lightness : lightness,
        )
        .toColor();
  }

  HSLColor _getPatchedHslColor() {
    final hslColor = HSLColor.fromColor(this);

    // A pure dark color have saturation level at 1.0, which results in red when lighten it.
    // We reset this value to 0.0, so the result is desaturated as expected:
    return hslColor.withSaturation(hslColor.lightness == 0.0 ? 0.0 : hslColor.saturation);
  }

  /// Returns a hex representation (`#AARRGGBB`) of the color.
  String toHex() {
    return '#${alpha.toHex()}${red.toHex()}${green.toHex()}${blue.toHex()}';
  }
}

extension on int {
  String toHex() => toRadixString(16).padLeft(2, '0');
}
