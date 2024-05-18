part of '../themes/scheme.dart';

SliderThemeData _sliderThemeData(
  ColorScheme colorScheme,
  ArgoColorTheme colorTheme,
) {
  Color inactiveTrack = colorScheme.isLight ? ArgoColors.slate.shade100 : ArgoColors.slate.shade850;
  return SliderThemeData(
    activeTrackColor: inactiveTrack,
    inactiveTrackColor: inactiveTrack,
    thumbColor: colorTheme.primaryBackground(colorScheme.brightness),
    disabledThumbColor: colorScheme.secondary,
    disabledActiveTrackColor: inactiveTrack,
    disabledInactiveTrackColor: inactiveTrack,
  );
}
