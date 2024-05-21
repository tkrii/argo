part of '../themes/scheme_theme.dart';

ExpansionTileThemeData _expansionTileThemeData(
  ColorScheme colorScheme,
) =>
    ExpansionTileThemeData(
      textColor: colorScheme.primary,
      collapsedTextColor: colorScheme.onSurface,
      iconColor: colorScheme.onSurface,
      collapsedIconColor: colorScheme.onSurface.adjust(alpha: 0.6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      childrenPadding: EdgeInsets.only(bottom: kSpacing),
    );
