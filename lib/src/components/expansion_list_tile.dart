part of '../themes/scheme_theme.dart';

ExpansionTileThemeData _expansionTileThemeData(
  ColorScheme colorScheme,
) =>
    ExpansionTileThemeData(
      textColor: colorScheme.primary,
      collapsedTextColor: colorScheme.onSurface,
      iconColor: colorScheme.tertiary,
      collapsedIconColor: colorScheme.onSurface.adjust(alpha: 0.6),
    );
