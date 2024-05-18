part of '../themes/scheme.dart';

ExpansionTileThemeData _expansionTileThemeData(
  ColorScheme colorScheme,
  ArgoColorTheme colorTheme,
) =>
    ExpansionTileThemeData(
      textColor: colorTheme.primaryHover(colorScheme.brightness),
      collapsedTextColor: colorScheme.onSurface,
      iconColor: colorScheme.onSurface,
      collapsedIconColor: colorScheme.onSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      childrenPadding: EdgeInsets.only(bottom: kSpacing),
    );
