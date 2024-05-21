part of '../themes/scheme_theme.dart';

InputDecorationTheme _inputDecorationTheme(ColorScheme colorScheme) {
  TextStyle textStyle = createTextTheme(colorScheme.onSurface).bodySmall!.copyWith(
        color: colorScheme.onSurface,
      );

  return InputDecorationTheme(
    labelStyle: textStyle,
    filled: true,
    fillColor: colorScheme.surfaceContainerHighest,
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
    iconColor: colorScheme.onSurface.scale(alpha: -0.2),
    disabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(kBorderRadius),
        topLeft: Radius.circular(kBorderRadius),
      ),
      borderSide: BorderSide(
        width: kBorderWidth,
        color: _disabled(
          colorScheme.inverseSurface.mix(colorScheme.surface, 75),
        ),
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(kBorderRadius),
        topLeft: Radius.circular(kBorderRadius),
      ),
      borderSide: BorderSide(
        width: kBorderWidth,
        color: colorScheme.inverseSurface.mix(colorScheme.surface, 75),
      ),
    ),
    errorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(kBorderRadius),
        topLeft: Radius.circular(kBorderRadius),
      ),
      borderSide: BorderSide(
        width: kBorderWidth,
        color: colorScheme.errorContainer,
      ),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(kBorderRadius),
        topLeft: Radius.circular(kBorderRadius),
      ),
      borderSide: BorderSide(
        width: kBorderOutline,
        color: colorScheme.error,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(kBorderRadius),
        topLeft: Radius.circular(kBorderRadius),
      ),
      borderSide: BorderSide(
        width: kBorderOutline,
        color: colorScheme.tertiary,
      ),
    ),
    activeIndicatorBorder: BorderSide(
      color: colorScheme.primary,
      width: kBorderOutline,
    ),
  );
}

TextSelectionThemeData _textSelectionThemeData(ColorScheme colorScheme) => TextSelectionThemeData(
      cursorColor: colorScheme.primary,
      selectionColor: (colorScheme.primary.mix(colorScheme.surface)).scale(alpha: -0.5),
      selectionHandleColor: colorScheme.tertiary,
    );
