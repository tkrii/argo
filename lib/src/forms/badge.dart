part of '../themes/scheme.dart';

BadgeThemeData _badgeThemeData(ColorScheme colorScheme) {
  return BadgeThemeData(
    backgroundColor: colorScheme.tertiary,
    textColor: colorScheme.onTertiary.brightness == Brightness.light ? ArgoColors.white : ArgoColors.black,
    smallSize: rem,
  );
}
