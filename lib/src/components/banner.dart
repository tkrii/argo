part of '../themes/scheme.dart';

MaterialBannerThemeData _materialBannerThemeData(ColorScheme colorScheme) {
  return MaterialBannerThemeData(
    backgroundColor: colorScheme.surfaceContainerLow,
    shadowColor: colorScheme.shadow,
    dividerColor: colorScheme.outlineVariant,
    elevation: 1,
  );
}
