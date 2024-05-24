part of '../themes/scheme_theme.dart';

CheckboxThemeData _checkboxThemeData(ColorScheme colorScheme) =>
    CheckboxThemeData(
      fillColor: WidgetStateColor.resolveWith(
        (state) {
          if (state.contains(WidgetState.selected)) {
            if (state.contains(WidgetState.disabled)) {
              return colorScheme.outlineVariant;
            } else if (state.contains(WidgetState.error)) {
              return colorScheme.errorContainer;
            }
            return colorScheme.primary;
          } else {
            return ArgoColors.transparent;
          }
        },
      ),
      side: WidgetStateBorderSide.resolveWith(
        (state) {
          if (state.contains(WidgetState.error)) {
            return BorderSide(
              color: colorScheme.errorContainer,
              width: kBorderOutline,
            );
          }
          if (!state.contains(WidgetState.disabled)) {
            if (state.contains(WidgetState.selected)) {
              return BorderSide(
                color: colorScheme.secondary,
                width: kBorderOutline,
              );
            } else {
              return BorderSide(
                color: colorScheme.onSurface,
                width: kBorderOutline,
              );
            }
          } else {
            return BorderSide(
              color: colorScheme.outlineVariant,
              width: kBorderOutline,
            );
          }
        },
      ),
      checkColor: WidgetStateProperty.resolveWith(
        (state) {
          if (!state.contains(WidgetState.disabled)) {
            if (state.contains(WidgetState.selected)) {
              return colorScheme.onPrimary;
            }
            return colorScheme.inverseSurface;
          }
          return colorScheme.outlineVariant;
        },
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius / 2),
      ),
    );

RadioThemeData _radioThemeData(ColorScheme colorScheme) => RadioThemeData(
      fillColor: WidgetStateColor.resolveWith(
        (state) {
          if (state.contains(WidgetState.selected)) {
            if (state.contains(WidgetState.disabled)) {
              return colorScheme.outlineVariant;
            } else if (state.contains(WidgetState.error)) {
              return colorScheme.errorContainer;
            } else {
              return colorScheme.primary;
            }
          } else if (state.contains(WidgetState.disabled)) {
            return colorScheme.outlineVariant;
          } else {
            return colorScheme.onSurface;
          }
        },
      ),
    );

SwitchThemeData _switchThemeData(ColorScheme colorScheme) => SwitchThemeData(
      trackColor: WidgetStateColor.resolveWith((state) {
        Color color = colorScheme.onSurface.mix(colorScheme.surfaceBright);
        if (state.contains(WidgetState.selected)) {
          color = colorScheme.success;
        }
        if (state.contains(WidgetState.disabled)) {
          color = _disabled(color);
        }
        return color;
      }),
      thumbColor: WidgetStateColor.resolveWith(
        (state) {
          Color color = ArgoColors.white;
          if (state.contains(WidgetState.disabled)) {
            color = _disabled(color);
          }
          return color;
        },
      ),
      trackOutlineColor: WidgetStateColor.transparent,
      trackOutlineWidth: WidgetStatePropertyAll(rem * 0.1875),
    );
