part of '../themes/scheme_theme.dart';

TooltipThemeData _tooltipTheme(ColorScheme colorScheme) {
  return TooltipThemeData(
    padding: EdgeInsets.symmetric(
      vertical: 0.5 * rem,
      horizontal: 0.25 * rem,
    ),
    verticalOffset: kSpacing,
  );
}

SnackBarThemeData _snackBarThemeData(ColorScheme colorScheme) {
  return SnackBarThemeData(
    backgroundColor: colorScheme.inverseSurface,
    actionTextColor: colorScheme.inversePrimary,
    elevation: 6,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kBorderRadius),
    ),
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.down,
  );
}
