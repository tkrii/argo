part of '../themes/scheme.dart';

ChipThemeData _chipThemeData(ColorScheme colorScheme, ArgoColorTheme colorTheme) => ChipThemeData(
      color: WidgetStateColor.resolveWith(
        (state) {
          if (!state.contains(WidgetState.disabled)) {
            if (state.contains(WidgetState.error)) {
              return colorScheme.error;
            }
            if (state.contains(WidgetState.selected)) {
              return colorTheme.primaryBackground(colorScheme.brightness);
            }
            return colorScheme.surfaceContainer;
          } else {
            return _disabled(
              colorTheme.primary(colorScheme.brightness),
            );
          }
        },
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: kBorderWidth,
          color: colorScheme.outline,
        ),
        borderRadius: BorderRadius.circular(kBigBorderRadius),
      ),
    );
