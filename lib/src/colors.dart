import 'package:flutter/material.dart'
    show Brightness, BuildContext, Color, HSLColor, Theme;

/// Available Argo colors.
class ArgoColors {
  const ArgoColors._({
    required this.link,
    required this.success,
    required this.alert,
    required this.error,
  });

  factory ArgoColors.light() => const ArgoColors._(
        link: Color(0xff0a59f7),
        success: Color(0xff64bb5c),
        alert: Color(0xffed6f21),
        error: Color(0xffe84026),
      );

  factory ArgoColors.dark() => const ArgoColors._(
        link: Color(0xff317af7),
        success: Color(0xff5ba854),
        alert: Color(0xffdb6b42),
        error: Color(0xffd94838),
      );

  static ArgoColors of(BuildContext context) =>
      from(Theme.of(context).brightness);

  static ArgoColors from(Brightness brightness) =>
      brightness == Brightness.light ? ArgoColors.light() : ArgoColors.dark();

  ///Link
  final Color link;

  ///Error
  final Color error;

  ///Warning
  final Color alert;

  ///Success
  final Color success;

  /// Completely invisible.
  static const Color transparent = Color(0x00000000);

  /// Black with 42% opacity.
  static const Color barrierColor = Color(0x6B000000);

  /// HSL(0,0,0).
  static const Color shade00 = Color(0xFF000000);

  /// HSL(0,0,1.6).
  static const Color shade04 = Color(0xFF040404);

  /// HSL(0,0,2.7).
  static const Color shade07 = Color(0xFF070707);

  /// HSL(0,0,4.7).
  static const Color shade12 = Color(0xFF0C0C0C);

  /// HSL(0,0,12.5).
  static const Color shade32 = Color(0xFF202020);

  /// HSL(0,0,14.5).
  static const Color shade37 = Color(0xFF252525);

  /// HSL(0,0,17.6).
  static const Color shade45 = Color(0xFF2D2D2D);

  /// HSL(0,0,22.4).
  static const Color shade57 = Color(0xFF393939);

  /// HSL(0,0,39.6).
  static const Color shade101 = Color(0xFF656565);

  /// HSL(0,0,42.4).
  static const Color shade108 = Color(0xFF6C6C6C);

  /// HSL(0,0,57.6).
  static const Color shade147 = Color(0xFF939393);

  /// HSL(0,0,60.4).
  static const Color shade154 = Color(0xFF9A9A9A);

  /// HSL(0,0,82.4).
  static const Color shade210 = Color(0xFFD2D2D2);

  /// HSL(0,0,95.3).
  static const Color shade243 = Color(0xFFF3F3F3);

  /// HSL(0,0,97.3).
  static const Color shade248 = Color(0xFFF8F8F8);

  /// HSL(0,0,98.4).
  static const Color shade251 = Color(0xFFFBFBFB);

  /// HSL(0,0,100).
  static const Color shade255 = Color(0xFFFFFFFF);
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
    return hslColor
        .withSaturation(hslColor.lightness == 0.0 ? 0.0 : hslColor.saturation);
  }

  /// Returns a hex representation (`#AARRGGBB`) of the color.
  String toHex() {
    return '#${alpha.toHex()}${red.toHex()}${green.toHex()}${blue.toHex()}';
  }
}

extension on int {
  String toHex() => toRadixString(16).padLeft(2, '0');
}
