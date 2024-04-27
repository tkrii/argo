part of '../base_theme.dart';

final _commonButtonStyle = ButtonStyle(
  padding: isMobile
      ? const MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
        )
      : const MaterialStatePropertyAll(EdgeInsets.all(10)),
  iconSize: isMobile
      ? const MaterialStatePropertyAll(kComfortableButtonIconSize)
      : const MaterialStatePropertyAll(kCompactButtonIconSize),
);

final _buttonThemeData = ButtonThemeData(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(kButtonRadius),
  ),
);

OutlinedButtonThemeData _createOutlinedButtonTheme(
  ColorScheme colorScheme,
) {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: BorderSide(
        color: colorScheme.outline.outerColor,
      ), // background defaults to transparent
      foregroundColor: colorScheme.onSurface,
      disabledForegroundColor: colorScheme.outlineVariant,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kButtonRadius),
      ),
    ).merge(_commonButtonStyle),
  );
}

TextButtonThemeData _createTextButtonTheme(
  ColorScheme colorScheme,
) {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      iconColor: colorScheme.primary,
      disabledIconColor: colorScheme.outlineVariant,
      foregroundColor: colorScheme.primary,
      disabledForegroundColor: colorScheme.outlineVariant,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kButtonRadius),
      ),
    ).merge(_commonButtonStyle),
  );
}

ElevatedButtonThemeData _createElevatedButtonTheme(
  ColorScheme colorScheme,
) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      disabledBackgroundColor: colorScheme.outlineVariant.withOpacity(0.1),
      backgroundColor: colorScheme.surfaceTint,
      disabledForegroundColor: colorScheme.outlineVariant,
      foregroundColor: colorScheme.onSurface,
      elevation: 1,
      shadowColor: ArgoColors.barrierColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: colorScheme.outline,
        ),
        borderRadius: BorderRadius.circular(kButtonRadius),
      ),
    ).merge(_commonButtonStyle),
  );
}

FilledButtonThemeData _createFilledButtonTheme(
  ColorScheme colorScheme, [
  Color? buttonColor,
]) {
  return FilledButtonThemeData(
    style: FilledButton.styleFrom(
      disabledBackgroundColor: colorScheme.outlineVariant.withOpacity(0.1),
      backgroundColor: buttonColor ?? colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      elevation: 1,
      shadowColor: ArgoColors.barrierColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kButtonRadius),
      ),
    ).merge(_commonButtonStyle),
  );
}

FloatingActionButtonThemeData _createFloatingActionButtonTheme(
  ColorScheme colorScheme, [
  Color? buttonColor,
]) {
  const elevation = 3.0;
  final bg = buttonColor ?? colorScheme.secondary;

  return FloatingActionButtonThemeData(
    backgroundColor: bg,
    foregroundColor: bg.onBackgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kWindowRadius * 5),
      side: colorScheme.isHighContrast
          ? BorderSide(color: colorScheme.outlineVariant)
          : BorderSide.none,
    ),
    elevation: elevation,
    focusElevation: elevation + 1,
    hoverElevation: elevation + 1,
    disabledElevation: 0,
    highlightElevation: elevation,
  );
}

IconButtonThemeData _createIconButtonTheme(ColorScheme colorScheme) {
  return IconButtonThemeData(
    style: IconButton.styleFrom(
      disabledBackgroundColor: colorScheme.outlineVariant.withOpacity(0.1),
      padding: isMobile ? null : EdgeInsets.zero,
      highlightColor: colorScheme.primary.withOpacity(0.05),
      fixedSize: isMobile
          ? null
          : const Size(kCompactButtonHeight, kCompactButtonHeight),
      minimumSize: isMobile
          ? null
          : const Size(kCompactButtonHeight, kCompactButtonHeight),
      maximumSize: isMobile
          ? null
          : const Size(kCompactButtonHeight, kCompactButtonHeight),
      tapTargetSize: isMobile
          ? MaterialTapTargetSize.padded
          : MaterialTapTargetSize.shrinkWrap,
      iconSize: isMobile ? kComfortableIconSize : kCompactIconSize,
    ),
  );
}

SegmentedButtonThemeData _createSegmentedButtonTheme(ColorScheme colorScheme) {
  return SegmentedButtonThemeData(
    style: SegmentedButton.styleFrom(
      selectedBackgroundColor: colorScheme.primary,
      selectedForegroundColor: colorScheme.onPrimary,
      disabledBackgroundColor: colorScheme.outlineVariant.withOpacity(0.12),
      backgroundColor: colorScheme.surfaceTint,
      foregroundColor: colorScheme.onSurface,
      elevation: 1,
      shadowColor: ArgoColors.barrierColor,
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(kButtonRadius)),
    ).merge(_commonButtonStyle),
  );
}

ToggleButtonsThemeData _createToggleButtonsTheme(ColorScheme colorScheme) {
  return ToggleButtonsThemeData(
    constraints: isMobile
        ? const BoxConstraints(
            minHeight: kComfortableButtonHeight,
            minWidth: 60,
            maxWidth: double.infinity,
            maxHeight: kComfortableButtonHeight,
          )
        : const BoxConstraints(
            minHeight: kCompactButtonHeight,
            minWidth: 50,
            maxWidth: double.infinity,
            maxHeight: kCompactButtonHeight,
          ),
    borderRadius: const BorderRadius.all(
      Radius.circular(kButtonRadius),
    ),
    borderColor: colorScheme.outline,
    selectedColor: colorScheme.onPrimary,
    selectedBorderColor: colorScheme.isHighContrast
        ? colorScheme.outlineVariant
        : colorScheme.primary.outerColor,
    fillColor: colorScheme.primary,
    hoverColor: colorScheme.primary.withOpacity(.05),
  );
}
