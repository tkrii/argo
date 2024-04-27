part of '../base_theme.dart';

CheckboxThemeData _createCheckBoxTheme(ColorScheme colorScheme) {
  return CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kCheckRadius),
    ),
    fillColor: MaterialStateProperty.resolveWith(
      (states) {
        if (!states.contains(MaterialState.disabled)) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return ArgoColors.transparent;
        }
        return colorScheme.outlineVariant;
      },
    ),
    checkColor: MaterialStateProperty.resolveWith(
      (states) {
        if (!states.contains(MaterialState.disabled)) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.onPrimary;
          }
          return colorScheme.inverseSurface;
        }
        return colorScheme.outlineVariant.onBackgroundColor;
      },
    ),
  );
}

RadioThemeData _createRadioTheme(ColorScheme colorScheme) {
  return RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith(
      (states) {
        if (!states.contains(MaterialState.disabled)) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.inverseSurface;
        }
        return colorScheme.outlineVariant;
      },
    ),
  );
}

SwitchThemeData _createSwitchTheme(ColorScheme colorScheme) {
  return SwitchThemeData(
    trackOutlineColor: MaterialStateColor.resolveWith(
      (states) => states.contains(MaterialState.disabled)
          ? colorScheme.outlineVariant
          : colorScheme.success,
    ),
    thumbColor: MaterialStateProperty.resolveWith(
      (states) => _getSwitchThumbColor(states, colorScheme),
    ),
    trackColor: MaterialStateProperty.resolveWith(
      (states) => _getSwitchTrackColor(states, colorScheme),
    ),
    //trackOutlineWidth: const MaterialStatePropertyAll(2),
  );
}

Color _getSwitchThumbColor(Set<MaterialState> states, ColorScheme colorScheme) {
  if (states.contains(MaterialState.disabled)) {
    if (states.contains(MaterialState.selected)) {
      return colorScheme.outlineVariant;
    }
    return colorScheme.outlineVariant;
  } else {
    return ArgoColors.shade255;
  }
}

Color _getSwitchTrackColor(Set<MaterialState> states, ColorScheme colorScheme) {
  if (states.contains(MaterialState.disabled)) {
    return ArgoColors.transparent;
  } else {
    if (states.contains(MaterialState.selected)) {
      return colorScheme.success.applyOverlay;
    } else {
      return colorScheme.success.scale(lightness: -0.4, alpha: -0.1);
    }
  }
}
