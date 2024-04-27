part of '../base_theme.dart';

InputDecorationTheme _createInputDecorationTheme(ColorScheme colorScheme) {
  final radius = BorderRadius.circular(
    kCheckRadius,
  );
  const width = 1.0;
  const strokeAlign = 0.0;
  final fill = colorScheme.surfaceTint;
  final border = colorScheme.outline;
  final disabledBorder = colorScheme.outlineVariant;

  const textStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  return InputDecorationTheme(
    filled: true,
    fillColor: fill,
    border: OutlineInputBorder(
      borderSide: BorderSide(
        width: width,
        color: border,
      ),
      borderRadius: radius,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: width,
        color: colorScheme.primary,
      ),
      borderRadius: radius,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: width,
        color: border,
        strokeAlign: strokeAlign,
      ),
      borderRadius: radius,
    ),
    activeIndicatorBorder: const BorderSide(
      width: width,
      strokeAlign: strokeAlign,
    ),
    outlineBorder: const BorderSide(
      width: width,
      strokeAlign: strokeAlign,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: width,
        color: colorScheme.error,
        strokeAlign: strokeAlign,
      ),
      borderRadius: radius,
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: width,
        color: colorScheme.error,
        strokeAlign: strokeAlign,
      ),
      borderRadius: radius,
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: width,
        color: disabledBorder,
        strokeAlign: strokeAlign,
      ),
      borderRadius: radius,
    ),
    isDense: !isMobile,
    contentPadding: isMobile
        ? const EdgeInsets.all(12)
        : const EdgeInsets.only(
            left: 12,
            right: 12,
            bottom: 10,
            top: 12,
          ),
    labelStyle: isMobile ? null : textStyle,
    helperStyle: isMobile
        ? null
        : textStyle.copyWith(
            color: colorScheme.secondaryText,
          ),
    hintStyle: isMobile
        ? null
        : textStyle.copyWith(
            color: colorScheme.secondaryText,
          ),
    suffixStyle: isMobile
        ? null
        : textStyle.copyWith(
            color: colorScheme.secondaryText,
          ),
    prefixStyle: isMobile
        ? null
        : textStyle.copyWith(
            color: colorScheme.secondaryText,
          ),
  );
}

MenuStyle _createMenuStyle(ColorScheme colorScheme) {
  return MenuStyle(
    backgroundColor: MaterialStateProperty.all(colorScheme.surface),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        side: BorderSide(
          color: colorScheme.outline,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(kButtonRadius),
      ),
    ),
    side: MaterialStateBorderSide.resolveWith(
      (states) => BorderSide(
        color: colorScheme.outline,
      ),
    ),
    elevation: MaterialStateProperty.all(1),
  );
}

PopupMenuThemeData _createPopupMenuTheme(ColorScheme colorScheme) {
  return PopupMenuThemeData(
    color: colorScheme.surface,
    iconSize: isMobile ? kComfortableButtonIconSize : kCompactButtonIconSize,
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kButtonRadius),
      borderSide: BorderSide(
        color: colorScheme.outline,
      ),
    ),
  );
}

MenuThemeData _createMenuTheme(ColorScheme colorScheme) {
  return MenuThemeData(
    style: _createMenuStyle(colorScheme),
  );
}

DropdownMenuThemeData _createDropdownMenuTheme(ColorScheme colorScheme) {
  return DropdownMenuThemeData(
    inputDecorationTheme: _createInputDecorationTheme(colorScheme),
    menuStyle: _createMenuStyle(colorScheme),
  );
}

TextSelectionThemeData _createTextSelectionTheme(ColorScheme colorScheme) {
  return TextSelectionThemeData(
    cursorColor: colorScheme.primary,
    selectionColor: colorScheme.primary.scale(alpha: -2 / 3),
    selectionHandleColor: colorScheme.primary,
  );
}
