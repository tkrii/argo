part of '../themes/scheme.dart';

BottomAppBarTheme _bottomAppBarTheme(ColorScheme colorScheme) => BottomAppBarTheme(
      color: colorScheme.surfaceContainerLow,
    );

BottomNavigationBarThemeData _bottomNavigationTheme(ColorScheme colorScheme) {
  return BottomNavigationBarThemeData(
    elevation: 6,
    backgroundColor: colorScheme.surfaceContainerLow,
    selectedItemColor: colorScheme.primary,
    unselectedItemColor: colorScheme.onSurface,
  );
}

NavigationBarThemeData _navigationBarTheme(ColorScheme colorScheme) {
  return NavigationBarThemeData(
    elevation: 6,
    backgroundColor: colorScheme.surfaceContainerLow,
    indicatorColor: colorScheme.surfaceContainerLowest,
    indicatorShape: RoundedRectangleBorder(
      side: BorderSide(
        color: colorScheme.outline,
        width: kBorderOutline,
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
