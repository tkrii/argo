part of '../themes/scheme_theme.dart';

DrawerThemeData _drawerTheme(ColorScheme colorScheme) {
  return DrawerThemeData(
    elevation: 8,
    backgroundColor: colorScheme.surfaceContainerLow,
  );
}

NavigationDrawerThemeData _navigationDrawerTheme(ColorScheme colorScheme) {
  return NavigationDrawerThemeData(
    backgroundColor: colorScheme.surfaceContainerLow,
    elevation: 8,
    indicatorColor: colorScheme.primary,
    iconTheme: WidgetStateProperty.resolveWith(
      (states) => states.contains(WidgetState.selected)
          ? IconThemeData(color: colorScheme.onPrimary)
          : IconThemeData(
              color: colorScheme.onSurface.withOpacity(0.6),
            ),
    ),
  );
}
