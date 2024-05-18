part of '../themes/scheme.dart';

CheckboxThemeData _checkboxThemeData(ColorScheme colorScheme, ArgoColorTheme colorTheme) {
  return CheckboxThemeData(
    fillColor: WidgetStateColor.resolveWith(
      (state) {
        if (state.contains(WidgetState.selected)) {
          if (state.contains(WidgetState.disabled)) {
            return colorScheme.secondary;
          } else if (state.contains(WidgetState.error)) {
            return colorScheme.errorContainer;
          }
          return colorTheme.primaryBackground(colorScheme.brightness);
        } else {
          return ArgoColors.transparent;
        }
      },
    ),
    checkColor: WidgetStateProperty.resolveWith(
      (state) {
        if (!state.contains(WidgetState.disabled)) {
          if (state.contains(WidgetState.selected)) {
            return colorScheme.onPrimary.brightness == Brightness.light ? ArgoColors.white : ArgoColors.black;
          }
          return colorScheme.inverseSurface;
        }
        return colorScheme.onSecondary;
      },
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kBorderRadius),
    ),
  );
}

RadioThemeData _radioThemeData(ColorScheme colorScheme, ArgoColorTheme colorTheme) {
  return RadioThemeData(
    fillColor: WidgetStateColor.resolveWith(
      (state) {
        if (state.contains(WidgetState.selected)) {
          if (state.contains(WidgetState.disabled)) {
            return colorScheme.secondary;
          } else if (state.contains(WidgetState.error)) {
            return colorScheme.errorContainer;
          } else {
            return colorTheme.primaryBackground(colorScheme.brightness);
          }
        } else if (state.contains(WidgetState.disabled)) {
          return colorScheme.outlineVariant.mix(colorScheme.outline);
        } else {
          return colorScheme.onSurface.brightness == Brightness.light ? ArgoColors.white : ArgoColors.black;
        }
      },
    ),
  );
}

SwitchThemeData _switchThemeData(ColorScheme colorScheme, ArgoColorTheme colorTheme) {
  return SwitchThemeData(
    thumbColor: WidgetStateColor.resolveWith((state) {
      Color color = colorScheme.secondary;
      if (state.contains(WidgetState.selected)) {
        color = colorTheme.primaryInverse(colorScheme.brightness);
      }
      if (state.contains(WidgetState.disabled)) {
        color = _disabled(colorScheme.secondary);
      }
      return color;
    }),
    trackColor: WidgetStateColor.resolveWith(
      (state) {
        Color color = colorTheme.primaryBackground(colorScheme.brightness);

        if (!state.contains(WidgetState.selected) || state.contains(WidgetState.disabled)) {
          color = colorScheme.isLight ? ArgoColors.slate.shade200 : ArgoColors.slate.shade750;
        }
        if (state.contains(WidgetState.disabled)) {
          color = _disabled(color);
        }
        return color;
      },
    ),
    trackOutlineColor: WidgetStateColor.transparent,
    trackOutlineWidth: WidgetStatePropertyAll(rem * 0.1875),
  );
}
