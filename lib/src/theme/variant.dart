import 'package:argo/argo.dart' show createArgoLightTheme, createArgoDarkTheme;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show BuildContext, Color, Theme, ThemeData;

/// Describes a Argo variant and its primary color.
enum ArgoVariant {
  blue(
    Color(0xff5f58c7),
    Color(0xff564af7),
  ),
  lightBlue(
    Color(0xff4796c4),
    Color(0xff46b1e3),
  ),
  cyan(
    Color(0xff5aada0),
    Color(0xff61cfbe),
  ),
  green(
    Color(0xff5ba854),
    Color(0xff64bb5c),
  ),
  lime(
    Color(0xff86ad53),
    Color(0xffa5d61d),
  ),
  purple(
    Color(0xff8c55c2),
    Color(0xffac49f5),
  ),
  pink(
    Color(0xffd64966),
    Color(0xffe64566),
  ),
  red(
    Color(0xffd94838),
    Color(0xffe84026),
  ),
  orange(
    Color(0xffdb6b42),
    Color(0xffed6f21),
  ),
  lightOrange(
    Color(0xffe08c3a),
    Color(0xffd9a01e),
  ),
  yellow(
    Color(0xffd1a738),
    Color(0xfff7ce00),
  ),
  gray(
    Color(0xff838388),
    Color(0xff838388),
  );

  const ArgoVariant(this.color, this.darkColor);

  /// The primary color of the variant.
  final Color color;
  final Color darkColor;

  /// A light theme for the variant.
  ThemeData get lightTheme => _argoLightThemes[this]!;

  /// A dark theme for the variant.
  ThemeData get darkTheme => _argoDarkThemes[this]!;

  Color from(Brightness brightness) => brightness == Brightness.light ? color : darkColor;
  Color of(BuildContext context) => from(Theme.of(context).brightness);

  ThemeData theme(BuildContext context) => Theme.of(context).brightness == Brightness.light ? lightTheme : darkTheme;
  List<Color> get colors => [
        blue.color,
        lightBlue.color,
        cyan.color,
        green.color,
        lime.color,
        purple.color,
        pink.color,
        red.color,
        orange.color,
        lightOrange.color,
        yellow.color,
        gray.color,
      ];
  List<Color> get darkcolors => [
        blue.darkColor,
        lightBlue.darkColor,
        cyan.darkColor,
        green.darkColor,
        lime.darkColor,
        purple.darkColor,
        pink.darkColor,
        red.darkColor,
        orange.darkColor,
        lightOrange.darkColor,
        yellow.darkColor,
        gray.darkColor,
      ];
}

final _argoLightThemes = <ArgoVariant, ThemeData>{
  ArgoVariant.blue: createArgoLightTheme(
    primaryColor: ArgoVariant.blue.color,
  ),
  ArgoVariant.lightBlue: createArgoLightTheme(
    primaryColor: ArgoVariant.lightBlue.color,
  ),
  ArgoVariant.cyan: createArgoLightTheme(
    primaryColor: ArgoVariant.cyan.color,
  ),
  ArgoVariant.green: createArgoLightTheme(
    primaryColor: ArgoVariant.green.color,
  ),
  ArgoVariant.lime: createArgoLightTheme(
    primaryColor: ArgoVariant.lime.color,
  ),
  ArgoVariant.purple: createArgoLightTheme(
    primaryColor: ArgoVariant.purple.color,
  ),
  ArgoVariant.pink: createArgoLightTheme(
    primaryColor: ArgoVariant.pink.color,
  ),
  ArgoVariant.red: createArgoLightTheme(
    primaryColor: ArgoVariant.red.color,
  ),
  ArgoVariant.orange: createArgoLightTheme(
    primaryColor: ArgoVariant.orange.color,
  ),
  ArgoVariant.lightOrange: createArgoLightTheme(
    primaryColor: ArgoVariant.lightOrange.color,
  ),
  ArgoVariant.yellow: createArgoLightTheme(
    primaryColor: ArgoVariant.yellow.color,
  ),
  ArgoVariant.gray: createArgoLightTheme(
    primaryColor: ArgoVariant.gray.color,
  ),
};

final _argoDarkThemes = <ArgoVariant, ThemeData>{
  ArgoVariant.blue: createArgoDarkTheme(
    primaryColor: ArgoVariant.blue.darkColor,
  ),
  ArgoVariant.lightBlue: createArgoDarkTheme(
    primaryColor: ArgoVariant.lightBlue.darkColor,
  ),
  ArgoVariant.cyan: createArgoDarkTheme(
    primaryColor: ArgoVariant.cyan.darkColor,
  ),
  ArgoVariant.green: createArgoDarkTheme(
    primaryColor: ArgoVariant.green.darkColor,
  ),
  ArgoVariant.lime: createArgoDarkTheme(
    primaryColor: ArgoVariant.lime.darkColor,
  ),
  ArgoVariant.purple: createArgoDarkTheme(
    primaryColor: ArgoVariant.purple.darkColor,
  ),
  ArgoVariant.pink: createArgoDarkTheme(
    primaryColor: ArgoVariant.pink.darkColor,
  ),
  ArgoVariant.red: createArgoDarkTheme(
    primaryColor: ArgoVariant.red.darkColor,
  ),
  ArgoVariant.orange: createArgoDarkTheme(
    primaryColor: ArgoVariant.orange.darkColor,
  ),
  ArgoVariant.lightOrange: createArgoDarkTheme(
    primaryColor: ArgoVariant.lightOrange.darkColor,
  ),
  ArgoVariant.yellow: createArgoDarkTheme(
    primaryColor: ArgoVariant.yellow.darkColor,
  ),
  ArgoVariant.gray: createArgoDarkTheme(
    primaryColor: ArgoVariant.gray.darkColor,
  ),
};
