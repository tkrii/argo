part of '../themes/scheme.dart';

DatePickerThemeData _datePickerThemeData(ColorScheme colorScheme, ArgoColorTheme colorTheme) => DatePickerThemeData(
      backgroundColor: colorScheme.surfaceContainer,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      headerBackgroundColor: colorScheme.surfaceContainerLow,
      headerForegroundColor: colorScheme.surfaceContainerLow.foregroundBrightColor,
      dividerColor: colorScheme.outline,
      inputDecorationTheme: _inputDecorationTheme(colorScheme, colorTheme),
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

TimePickerThemeData _timePickerThemeData(ColorScheme colorScheme, ArgoColorTheme colorTheme) => TimePickerThemeData(
      backgroundColor: colorScheme.surfaceContainer,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      dayPeriodTextColor: WidgetStateColor.resolveWith(
        (state) {
          if (state.contains(WidgetState.selected)) {
            return colorScheme.secondary.foregroundBrightColor;
          }
          return colorScheme.surfaceContainerLow.foregroundColor;
        },
      ),
      dayPeriodColor: WidgetStateColor.resolveWith(
        (state) {
          if (state.contains(WidgetState.selected)) {
            return colorScheme.secondary;
          }
          return colorScheme.surfaceContainerLow;
        },
      ),
      dayPeriodShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      dialBackgroundColor: colorScheme.surfaceContainerLow,
      dialHandColor: colorTheme.primary(colorScheme.brightness),
      dialTextColor: WidgetStateColor.resolveWith(
        (state) {
          if (state.contains(WidgetState.selected)) {
            return colorTheme.primaryUnderline(colorScheme.brightness).foregroundBrightColor;
          }
          return colorScheme.surfaceContainerLow.foregroundColor;
        },
      ),
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
        side: BorderSide(color: colorScheme.outline),
      ),
      hourMinuteColor: WidgetStateColor.resolveWith(
        (state) {
          if (state.contains(WidgetState.selected)) {
            return colorTheme.primaryBackground(colorScheme.brightness);
          }
          return colorScheme.surfaceContainerLow;
        },
      ),
      hourMinuteTextColor: WidgetStateColor.resolveWith(
        (state) {
          if (state.contains(WidgetState.selected)) {
            return colorTheme.primaryBackground(colorScheme.brightness).foregroundBrightColor;
          }
          return colorScheme.onSurface;
        },
      ),
      inputDecorationTheme: _inputDecorationTheme(colorScheme, colorTheme),
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
