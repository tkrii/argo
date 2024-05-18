part of '../themes/scheme.dart';

ProgressIndicatorThemeData _progressIndicatorThemeData(
  ColorScheme colorScheme,
) {
  return ProgressIndicatorThemeData(
    color: colorScheme.primary,
    linearTrackColor: colorScheme.outline,
    circularTrackColor: colorScheme.outline,
    refreshBackgroundColor: colorScheme.surfaceContainer,
  );
}
