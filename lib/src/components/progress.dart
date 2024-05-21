part of '../themes/scheme_theme.dart';

ProgressIndicatorThemeData _progressIndicatorThemeData(
  ColorScheme colorScheme,
) {
  Color background = colorScheme.inverseSurface.mix(colorScheme.surface, 10);
  return ProgressIndicatorThemeData(
    color: colorScheme.primary,
    linearTrackColor: background,
    circularTrackColor: background,
    refreshBackgroundColor: colorScheme.surfaceContainer,
  );
}
