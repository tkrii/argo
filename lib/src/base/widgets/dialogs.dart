part of '../base_theme.dart';

CardTheme _createCardTheme(ColorScheme colorScheme) {
  return CardTheme(
    shadowColor: ArgoColors.barrierColor,
    color: colorScheme.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kWindowRadius),
    ),
    elevation: 3.0,
  );
}

DialogTheme _createDialogTheme(ColorScheme colorScheme) {
  return DialogTheme(
    backgroundColor: colorScheme.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kWindowRadius),
      side: BorderSide(
        color: colorScheme.outline,
      ),
    ),
    alignment: isMobile ? Alignment.bottomCenter : Alignment.center,
  );
}
