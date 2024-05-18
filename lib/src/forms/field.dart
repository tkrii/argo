part of '../themes/scheme.dart';

InputDecorationTheme _inputDecorationTheme(ColorScheme colorScheme, ArgoColorTheme colorTheme) {
  TextStyle textStyle = createTextTheme(colorScheme.onSurface).bodySmall!.copyWith(
        color: colorScheme.surfaceContainerLowest.foregroundBrightColor,
      );

  return InputDecorationTheme(
    labelStyle: WidgetStateTextStyle.resolveWith((state) {
      if (state.contains(WidgetState.disabled)) {
        textStyle.copyWith(
          color: _disabled(
            colorScheme.surfaceContainerLowest.foregroundColor,
          ),
        );
      }
      return textStyle;
    }),
    filled: true,
    fillColor: colorScheme.surfaceContainerLowest,
    floatingLabelStyle: createTextTheme(colorScheme.onSurface).labelLarge!,
    helperStyle: createTextTheme(colorScheme.onSurface).bodySmall!,
    helperMaxLines: 3,
    hintStyle: createTextTheme(colorScheme.onSurface).bodyMedium!.copyWith(
          color: colorScheme.outline,
        ),
    errorStyle: createTextTheme(colorScheme.onSurface).bodySmall?.copyWith(
          color: colorScheme.error,
        ),
    errorMaxLines: 3,
    isDense: !kIsMobile,
    contentPadding: EdgeInsets.all(kSmallSpacing),
    iconColor: colorScheme.outline,
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadius),
      borderSide: BorderSide(
        width: kBorderWidth,
        color: _disabled(colorScheme.isDark ? ArgoColors.slate.shade800 : ArgoColors.slate.shade150),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadius),
      borderSide: BorderSide(
        width: kBorderWidth,
        color: colorScheme.isDark ? ArgoColors.slate.shade800 : ArgoColors.slate.shade150,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadius),
      borderSide: BorderSide(
        width: kBorderWidth,
        color: colorScheme.errorContainer,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadius),
      borderSide: BorderSide(
        width: kBorderOutline,
        color: colorScheme.error,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadius),
      borderSide: BorderSide(
        width: kBorderOutline,
        color: colorTheme.primaryUnderline(colorScheme.brightness),
      ),
    ),
    activeIndicatorBorder: BorderSide(
      color: colorTheme.primaryUnderline(colorScheme.brightness),
      width: kBorderWidth,
    ),
  );
}

TextSelectionThemeData _textSelectionThemeData(ColorScheme colorScheme, ArgoColorTheme colorTheme) =>
    TextSelectionThemeData(
      cursorColor: colorScheme.primary,
      selectionColor: colorTheme.textSelectionColor(colorScheme.brightness),
      selectionHandleColor: colorScheme.secondary,
    );
