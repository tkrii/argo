part of '../themes/scheme_theme.dart';

BottomAppBarTheme _bottomAppBarTheme(ColorScheme colorScheme) => BottomAppBarTheme(
      color: colorScheme.surfaceContainerLow,
    );

BottomNavigationBarThemeData _bottomNavigationTheme(ColorScheme colorScheme) {
  return BottomNavigationBarThemeData(
    elevation: 5,
    backgroundColor: colorScheme.surfaceContainerLow,
    selectedItemColor: colorScheme.primary,
    unselectedItemColor: colorScheme.onSurface,
  );
}

NavigationBarThemeData _navigationBarTheme(ColorScheme colorScheme) {
  return NavigationBarThemeData(
    elevation: 5,
    backgroundColor: colorScheme.surfaceContainerLow,
    indicatorColor: colorScheme.surfaceContainerLowest,
    indicatorShape: RoundedRectangleBorder(
      side: BorderSide(
        color: colorScheme.outline,
        width: kBorderWidth,
      ),
      borderRadius: BorderRadius.circular(kBorderRadius),
    ),
    iconTheme: WidgetStateProperty.resolveWith(
      (states) => states.contains(WidgetState.selected)
          ? IconThemeData(color: colorScheme.onSurface)
          : IconThemeData(color: colorScheme.onSurface.withOpacity(0.6)),
    ),
  );
}
