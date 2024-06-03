part of '../themes/scheme_theme.dart';

SnackBarThemeData _snackBarThemeData(ColorScheme colorScheme) {
  return SnackBarThemeData(
    backgroundColor: colorScheme.inverseSurface,
    actionTextColor: colorScheme.inversePrimary,
    elevation: 6,
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.down,
  );
}
