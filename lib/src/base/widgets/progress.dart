part of '../base_theme.dart';

ProgressIndicatorThemeData _createProgressIndicatorTheme(
  ColorScheme colorScheme,
) {
  return ProgressIndicatorThemeData(
    circularTrackColor: colorScheme.outlineVariant.withOpacity(0.25),
    linearTrackColor: colorScheme.outlineVariant.withOpacity(0.25),
    refreshBackgroundColor: colorScheme.outlineVariant.withOpacity(0.25),
  );
}

SliderThemeData _createSliderTheme(ColorScheme colorScheme) {
  return SliderThemeData(
    thumbColor: ArgoColors.shade255,
    overlayShape: const RoundSliderOverlayShape(
      overlayRadius: 13,
    ),
    overlayColor: colorScheme.primary.outerColor,
    thumbShape: const RoundSliderThumbShape(elevation: 4.0),
    inactiveTrackColor: colorScheme.outlineVariant.withOpacity(0.25),
  );
}

ScrollbarThemeData _createScrollBarTheme(ColorScheme colorScheme) {
  return ScrollbarThemeData(
    mainAxisMargin: 3.0,
    crossAxisMargin: 3.0,
    thumbColor: MaterialStatePropertyAll(
      colorScheme.inverseSurface,
    ),
  );
}
