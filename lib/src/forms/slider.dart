part of '../themes/scheme_theme.dart';

SliderThemeData _sliderThemeData(
  ColorScheme colorScheme,
) {
  return SliderThemeData(
    activeTrackColor: colorScheme.primary,
    inactiveTrackColor: colorScheme.inverseSurface.mix(colorScheme.surface, 10),
    thumbColor: ArgoColors.white,
    disabledThumbColor: colorScheme.inverseSurface.mix(colorScheme.surface, 10),
    disabledActiveTrackColor: _disabled(
      colorScheme.primary,
    ),
    disabledInactiveTrackColor: _disabled(
      colorScheme.inverseSurface.mix(colorScheme.surface, 10),
    ),
  );
}
