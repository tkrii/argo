part of '../base_theme.dart';

MaterialBannerThemeData _createMaterialBannerTheme(ColorScheme colorScheme) {
  return MaterialBannerThemeData(
    dividerColor: colorScheme.outline,
    backgroundColor: colorScheme.surfaceVariant,
    shadowColor: ArgoColors.barrierColor,
    elevation: 0,
  );
}

SnackBarThemeData _createSnackBarTheme(ColorScheme colorScheme) {
  return SnackBarThemeData(
    width: kSnackBarWidth,
    backgroundColor: colorScheme.inverseSurface,
    closeIconColor: colorScheme.error,
    actionTextColor: colorScheme.secondary,
    contentTextStyle: TextStyle(color: colorScheme.onInverseSurface),
    actionBackgroundColor: Colors.transparent,
    disabledActionTextColor: colorScheme.outlineVariant,
    disabledActionBackgroundColor: Colors.transparent,
    behavior: SnackBarBehavior.floating,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        kWindowRadius,
      ),
    ),
  );
}

const _tooltipThemeData = TooltipThemeData(
  waitDuration: Duration(milliseconds: 300),
);
