part of '../base_theme.dart';

BadgeThemeData _createBadgeTheme(ColorScheme colorScheme) {
  return BadgeThemeData(
    backgroundColor: colorScheme.tertiary,
    textColor: colorScheme.onTertiary,
  );
}
