part of '../base_theme.dart';

ChipThemeData _createChipTheme({
  required Color selectedColor,
  required ColorScheme colorScheme,
}) {
  return ChipThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kButtonRadius),
    ),
    selectedColor: selectedColor,
    backgroundColor: colorScheme.surfaceTint,
    deleteIconColor: colorScheme.error,
    checkmarkColor: selectedColor.onBackgroundColor,
    elevation: 2,
    showCheckmark: false,
  );
}
