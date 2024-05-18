part of '../themes/scheme.dart';

ProgressIndicatorThemeData _progressIndicatorThemeData(
  ColorScheme colorScheme,
  ArgoColorTheme colorTheme,
) {
  Color background = colorScheme.isLight ? ArgoColors.slate.shade100 : ArgoColors.slate.shade850;
  return ProgressIndicatorThemeData(
    color: colorTheme.primaryBackground(colorScheme.brightness),
    linearTrackColor: background,
    circularTrackColor: background,
    refreshBackgroundColor: colorScheme.surfaceContainer,
  );
}
