part of '../themes/scheme.dart';

DrawerThemeData _drawerTheme(ColorScheme colorScheme) {
  return DrawerThemeData(
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.only(
        topEnd: Radius.circular(kBorderRadius),
        bottomEnd: Radius.circular(kBorderRadius),
      ),
      side: BorderSide(
        color: colorScheme.outline,
      ),
    ),
    backgroundColor: colorScheme.surfaceContainerLow,
  );
}

NavigationDrawerThemeData _navigationDrawerTheme(ColorScheme colorScheme) {
  return NavigationDrawerThemeData(
    backgroundColor: colorScheme.surfaceContainerLow,
    elevation: 8,
    indicatorColor: colorScheme.surfaceContainerLowest,
    indicatorShape: RoundedRectangleBorder(
      side: BorderSide(
        color: colorScheme.outline,
      ),
      borderRadius: BorderRadius.circular(kBorderRadius),
    ),
    iconTheme: WidgetStateProperty.resolveWith(
      (states) => states.contains(WidgetState.selected)
          ? IconThemeData(color: colorScheme.primary)
          : IconThemeData(color: colorScheme.onSurface),
    ),
  );
}
