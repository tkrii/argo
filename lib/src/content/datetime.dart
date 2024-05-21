part of '../themes/scheme_theme.dart';

DatePickerThemeData _datePickerThemeData(ColorScheme colorScheme) => DatePickerThemeData(
      backgroundColor: colorScheme.surfaceContainer,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      headerBackgroundColor: colorScheme.surfaceContainerHigh,
      headerForegroundColor: colorScheme.onSurface,
      dividerColor: colorScheme.outline,
      inputDecorationTheme: _inputDecorationTheme(colorScheme),
      cancelButtonStyle: ButtonStyle(
        backgroundColor: WidgetStateColor.transparent,
        foregroundColor: WidgetStatePropertyAll(
          colorScheme.error,
        ),
        overlayColor: WidgetStatePropertyAll(
          colorScheme.error.scale(alpha: -0.9),
        ),
      ).merge(_commonButtonStye),
    );

TimePickerThemeData _timePickerThemeData(ColorScheme colorScheme) => TimePickerThemeData(
      backgroundColor: colorScheme.surfaceContainer,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      dayPeriodTextColor: WidgetStateColor.resolveWith(
        (state) {
          if (state.contains(WidgetState.selected)) {
            return colorScheme.onTertiary;
          }
          return colorScheme.onSurface;
        },
      ),
      dayPeriodColor: WidgetStateColor.resolveWith(
        (state) {
          if (state.contains(WidgetState.selected)) {
            return colorScheme.tertiary;
          }
          return colorScheme.surfaceContainerHighest;
        },
      ),
      dayPeriodShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      dialBackgroundColor: colorScheme.surfaceContainerLow,
      dialHandColor: colorScheme.primary,
      dialTextColor: WidgetStateColor.resolveWith(
        (state) {
          if (state.contains(WidgetState.selected)) {
            return colorScheme.onPrimary;
          }
          return colorScheme.onSurface;
        },
      ),
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
        side: BorderSide(color: colorScheme.outline),
      ),
      hourMinuteColor: WidgetStateColor.resolveWith(
        (state) {
          if (state.contains(WidgetState.selected)) {
            return colorScheme.secondary;
          }
          return colorScheme.surfaceContainerHighest;
        },
      ),
      hourMinuteTextColor: WidgetStateColor.resolveWith(
        (state) {
          if (state.contains(WidgetState.selected)) {
            return colorScheme.onSecondary;
          }
          return colorScheme.onSurface;
        },
      ),
      inputDecorationTheme: _inputDecorationTheme(colorScheme),
      cancelButtonStyle: ButtonStyle(
        backgroundColor: WidgetStateColor.transparent,
        foregroundColor: WidgetStatePropertyAll(
          colorScheme.error,
        ),
        overlayColor: WidgetStatePropertyAll(
          colorScheme.error.scale(alpha: -0.9),
        ),
      ).merge(_commonButtonStye),
    );
