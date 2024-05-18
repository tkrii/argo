import 'package:argo/argo.dart';
import 'package:argo/src/themes/dark.dart';
import 'package:argo/src/themes/light.dart';
import 'package:argo/src/themes/theme_colors.dart';
import 'package:flutter/material.dart';

enum ArgoVariant {
  red(ArgoColors.red),
  pink(ArgoColors.pink),
  fuchsia(ArgoColors.fuchsia),
  purple(ArgoColors.purple),
  violet(ArgoColors.violet),
  indigo(ArgoColors.indigo),
  blue(ArgoColors.blue),
  azure(ArgoColors.azure),
  cyan(ArgoColors.cyan),
  jade(ArgoColors.jade),
  green(ArgoColors.green),
  lime(ArgoColors.lime),
  yellow(ArgoColors.yellow),
  amber(ArgoColors.amber),
  pumpkin(ArgoColors.pumpkin),
  orange(ArgoColors.orange),
  sand(ArgoColors.sand),
  grey(ArgoColors.grey),
  zinc(ArgoColors.zinc),
  slate(ArgoColors.slate);

  const ArgoVariant(this.argoColor);
  final MaterialColor argoColor;

  ThemeData get themeDark => createArgoDarkTheme(
        theme: ArgoColorTheme.fromArgoColor(argoColor),
      );
  ThemeData get theme => createArgoLightTheme(
        theme: ArgoColorTheme.fromArgoColor(argoColor),
      );
}
