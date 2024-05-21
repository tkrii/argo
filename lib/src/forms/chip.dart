part of '../themes/scheme_theme.dart';

ChipThemeData _chipThemeData(ColorScheme colorScheme) => ChipThemeData(
      color: WidgetStateColor.resolveWith(
        (state) {
          if (!state.contains(WidgetState.disabled)) {
            if (state.contains(WidgetState.error)) {
              return colorScheme.error;
            }
            if (state.contains(WidgetState.selected)) {
              return colorScheme.secondary;
            }
            return colorScheme.surfaceContainerHighest;
          } else {
            return _disabled(
              colorScheme.secondary,
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
