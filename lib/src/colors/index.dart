import 'package:flutter/material.dart' show Brightness, Color, ColorSwatch, BuildContext, Theme;

class ArgoColors {
  ArgoColors._({
    required this.link,
    required this.destructive,
    required this.success,
    required this.warning,
  });

  factory ArgoColors.light() => ArgoColors._(
        link: blue.shade5,
        destructive: red.shade5,
        success: green.shade4,
        warning: yellow.shade5,
      );

  factory ArgoColors.dark() => ArgoColors._(
        link: blue.shade5,
        destructive: red.shade4,
        success: green.shade5,
        warning: const Color(0xffcd9309),
      );

  factory ArgoColors.from(Brightness brightness) =>
      brightness == Brightness.light ? ArgoColors.light() : ArgoColors.dark();

  factory ArgoColors.of(BuildContext context) => ArgoColors.from(
        Theme.of(context).brightness,
      );

  final Color link;

  final Color destructive;

  final Color success;

  final Color warning;

  static const Color transparent = Color(0x00ffffff);

  static const Color white = Color(0xffffffff);

  static const Color black = Color(0xff000000);

  static const ArgoAccentColor blue = ArgoAccentColor(
    0xff3584e4,
    {
      1: Color(0xff99c1f1),
      2: Color(0xff62a0ea),
      3: Color(0xff3584e4),
      4: Color(0xff1c71d8),
      5: Color(0xff1a5fb4),
    },
  );

  static const ArgoAccentColor green = ArgoAccentColor(
    0xff33d17a,
    {
      1: Color(0xff8ff0a4),
      2: Color(0xff57e389),
      3: Color(0xff33d17a),
      4: Color(0xff2ec27e),
      5: Color(0xff26a269),
    },
  );

  static const ArgoAccentColor yellow = ArgoAccentColor(
    0xfff6d32d,
    {
      1: Color(0xfff9f06b),
      2: Color(0xfff8e45c),
      3: Color(0xfff6d32d),
      4: Color(0xfff5c211),
      5: Color(0xffe5a50a),
    },
  );

  static const ArgoAccentColor orange = ArgoAccentColor(
    0xffff7800,
    {
      1: Color(0xffffbe6f),
      2: Color(0xffffa348),
      3: Color(0xffff7800),
      4: Color(0xffe66100),
      5: Color(0xffc64600),
    },
  );

  static const ArgoAccentColor red = ArgoAccentColor(
    0xffe01b24,
    {
      1: Color(0xfff66151),
      2: Color(0xffed333b),
      3: Color(0xffe01b24),
      4: Color(0xffc01c28),
      5: Color(0xffa51d2d),
    },
  );

  static const ArgoAccentColor purple = ArgoAccentColor(
    0xff9141ac,
    {
      1: Color(0xffdc8add),
      2: Color(0xffc061cb),
      3: Color(0xff9141ac),
      4: Color(0xff813d9c),
      5: Color(0xff613583),
    },
  );

  static const ArgoAccentColor brown = ArgoAccentColor(
    0xff986a44,
    {
      1: Color(0xffcdab8f),
      2: Color(0xffb5835a),
      3: Color(0xff986a44),
      4: Color(0xff865e3c),
      5: Color(0xff63452c),
    },
  );

  static const ArgoAccentColor neutralLight = ArgoAccentColor(
    0xffdeddda,
    {
      1: white,
      2: Color(0xfff6f5f4),
      3: Color(0xffdeddda),
      4: Color(0xffc0bfbc),
      5: Color(0xff9a9996),
    },
  );

  static const ArgoAccentColor neutralDark = ArgoAccentColor(
    0xff3d3846,
    {
      1: Color(0xff77767b),
      2: Color(0xff5e5c65),
      3: Color(0xff3d3846),
      4: Color(0xff241f31),
      5: black,
    },
  );
}

class ArgoAccentColor extends ColorSwatch<int> {
  const ArgoAccentColor(
    super.primary,
    super.swatch,
  );

  /// The lightest shade
  Color get shade1 => this[1]!;

  /// The light shade
  Color get shade2 => this[2]!;

  /// The default shade
  Color get shade3 => this[3]!;

  /// The dark shade
  Color get shade4 => this[4]!;

  /// the darkest shade
  Color get shade5 => this[5]!;
}
