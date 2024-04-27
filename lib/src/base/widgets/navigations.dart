part of '../base_theme.dart';

BottomNavigationBarThemeData _createBottomNavigationTheme(
    ColorScheme colorScheme) {
  return BottomNavigationBarThemeData(
    elevation: 6,
    backgroundColor: colorScheme.surfaceVariant,
    selectedItemColor: colorScheme.primary,
    unselectedItemColor: colorScheme.secondaryText,
  );
}

NavigationBarThemeData _createNavigationBarTheme(ColorScheme colorScheme) {
  return NavigationBarThemeData(
    height: isMobile
        ? kComfortableNavigationBarHeight + 5
        : kCompactNavigationBarHeight + 5,
    elevation: 6,
    backgroundColor: colorScheme.surfaceVariant,
    indicatorColor: colorScheme.surfaceTint,
    indicatorShape: RoundedRectangleBorder(
      side: BorderSide(
        color: colorScheme.outline,
      ),
      borderRadius: BorderRadius.circular(kButtonRadius),
    ),
    iconTheme: MaterialStateProperty.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? IconThemeData(color: colorScheme.primary)
          : IconThemeData(color: colorScheme.secondaryText),
    ),
  );
}

BottomSheetThemeData _createBottomSheetTheme(ColorScheme colorScheme) {
  return BottomSheetThemeData(
    backgroundColor: colorScheme.surfaceVariant,
    elevation: 6,
    shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(kWindowRadius),
        topRight: Radius.circular(kWindowRadius),
      ),
      side: BorderSide(color: colorScheme.outline),
    ),
  );
}

DrawerThemeData _createDrawerTheme(ColorScheme colorScheme) {
  return DrawerThemeData(
    shadowColor: ArgoColors.barrierColor,
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: const BorderRadiusDirectional.only(
        topEnd: Radius.circular(kWindowRadius),
        bottomEnd: Radius.circular(kWindowRadius),
      ),
      side: BorderSide(
        color: colorScheme.outline,
      ),
    ),
    backgroundColor: colorScheme.surfaceVariant,
  );
}

NavigationDrawerThemeData _createNavigationDrawerTheme(
    ColorScheme colorScheme) {
  return NavigationDrawerThemeData(
    backgroundColor: colorScheme.surfaceVariant,
    shadowColor: ArgoColors.barrierColor,
    elevation: 8,
    indicatorColor: colorScheme.surfaceTint,
    indicatorShape: RoundedRectangleBorder(
      side: BorderSide(
        color: colorScheme.outline,
      ),
      borderRadius: BorderRadius.circular(kButtonRadius),
    ),
    iconTheme: MaterialStateProperty.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? IconThemeData(color: colorScheme.primary)
          : IconThemeData(color: colorScheme.secondaryText),
    ),
  );
}

NavigationRailThemeData _createNavigationRailTheme(ColorScheme colorScheme) {
  return NavigationRailThemeData(
    backgroundColor: colorScheme.surfaceVariant,
    indicatorColor: colorScheme.surfaceTint,
    indicatorShape: RoundedRectangleBorder(
      side: BorderSide(
        color: colorScheme.outline,
      ),
      borderRadius: BorderRadius.circular(kButtonRadius),
    ),
    selectedIconTheme: IconThemeData(
      color: colorScheme.primary,
      size: isMobile ? kComfortableIconSize : kCompactIconSize,
    ),
    unselectedIconTheme: IconThemeData(
      color: colorScheme.secondaryText,
      size: isMobile ? kComfortableIconSize : kCompactIconSize,
    ),
  );
}
