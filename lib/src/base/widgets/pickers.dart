part of '../base_theme.dart';

DatePickerThemeData _createDatePickerTheme(ColorScheme colorScheme) {
  return DatePickerThemeData(
    backgroundColor: colorScheme.surface,
    shadowColor: ArgoColors.barrierColor,
    elevation: 8,
    surfaceTintColor: colorScheme.surfaceTint,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: colorScheme.outline,
      ),
      borderRadius: BorderRadius.circular(kWindowRadius),
    ),
    headerBackgroundColor: colorScheme.surfaceVariant,
  );
}

TimePickerThemeData _createTimePickerTheme(ColorScheme colorScheme) {
  return TimePickerThemeData(
    backgroundColor: colorScheme.surface,
    elevation: 8,
    dialBackgroundColor:
        colorScheme.isLight ? ArgoColors.shade255 : ArgoColors.shade57,
    dialHandColor: colorScheme.primary,
    dayPeriodColor: colorScheme.tertiary,
    dayPeriodShape: RoundedRectangleBorder(
      side: BorderSide(
        color: colorScheme.outline,
      ),
      borderRadius: BorderRadius.circular(kButtonRadius),
    ),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: colorScheme.outline,
      ),
      borderRadius: BorderRadius.circular(kWindowRadius),
    ),
    hourMinuteColor:
        colorScheme.isLight ? ArgoColors.shade255 : ArgoColors.shade57,
    hourMinuteShape: RoundedRectangleBorder(
      side: BorderSide(
        color: colorScheme.outline,
      ),
      borderRadius: BorderRadius.circular(kButtonRadius),
    ),
  );
}
