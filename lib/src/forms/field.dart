part of '../themes/scheme_theme.dart';

InputDecorationTheme _inputDecorationTheme(ColorScheme colorScheme) {
  BorderRadius borderRadius = BorderRadius.only(
    topRight: Radius.circular(kBorderRadius),
    topLeft: Radius.circular(kBorderRadius),
  );
  return InputDecorationTheme(
    filled: true,
    fillColor: colorScheme.surfaceContainerHighest,
    counterStyle: createTextTheme(colorScheme.onSurface).bodySmall,
    helperStyle: createTextTheme(colorScheme.onSurface).bodySmall,
    errorStyle: createTextTheme(colorScheme.errorContainer).bodySmall,
    prefixStyle:
        createTextTheme(colorScheme.onSurface.scale(alpha: -0.2)).labelMedium,
    suffixStyle:
        createTextTheme(colorScheme.onSurface.scale(alpha: -0.2)).labelMedium,
    prefixIconColor: colorScheme.onSurface.scale(alpha: -0.2),
    suffixIconColor: colorScheme.onSurface.scale(alpha: -0.2),
    floatingLabelStyle: createTextTheme(colorScheme.onSurface).labelMedium,
    hintStyle:
        createTextTheme(colorScheme.onSurface.scale(alpha: -0.4)).bodyMedium,
    labelStyle: WidgetStateTextStyle.resolveWith((state) {
      if (state.contains(WidgetState.disabled)) {
        return createTextTheme(colorScheme.outlineVariant).bodyMedium!;
      }
      return createTextTheme(colorScheme.onSurface).bodyMedium!;
    }),
    helperMaxLines: 3,
    errorMaxLines: 3,
    isDense: !kIsMobile,
    contentPadding: EdgeInsets.all(kSmallSpacing),
    iconColor: colorScheme.onSurface.scale(alpha: -0.2),
    disabledBorder: UnderlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        width: kBorderWidth,
        color: _disabled(
          colorScheme.outlineVariant,
        ),
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        width: kBorderWidth,
        color: colorScheme.primary,
      ),
    ),
    errorBorder: UnderlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        width: kBorderWidth,
        color: colorScheme.errorContainer,
      ),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        width: kBorderOutline,
        color: colorScheme.error,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        width: kBorderOutline,
        color: colorScheme.tertiary,
      ),
    ),
  );
}

TextSelectionThemeData _textSelectionThemeData(ColorScheme colorScheme) =>
    TextSelectionThemeData(
      cursorColor: colorScheme.secondary,
      selectionColor: colorScheme.tertiary,
      selectionHandleColor: colorScheme.primary,
    );
