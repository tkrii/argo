part of '../themes/scheme_theme.dart';

TabBarTheme _tabBarTheme(ColorScheme colorScheme) {
  return TabBarTheme(
    indicatorColor: colorScheme.primary,
    dividerColor: colorScheme.outline,
    labelColor: colorScheme.primary,
    unselectedLabelColor: colorScheme.onSurface.withOpacity(0.6),
    overlayColor: WidgetStateColor.resolveWith(
      (states) => colorScheme.tertiary.withOpacity(1 / 3),
    ),
    indicatorSize: TabBarIndicatorSize.label,
  );
}

NavigationRailThemeData _navigationRailThemeData(ColorScheme colorScheme) {
  return NavigationRailThemeData(
    elevation: 5,
    backgroundColor: colorScheme.surfaceContainerLow,
    indicatorColor: colorScheme.surfaceContainerLowest,
    indicatorShape: RoundedRectangleBorder(
      side: BorderSide(
        color: colorScheme.outline,
        width: kBorderOutline,
      ),
      borderRadius: BorderRadius.circular(kBorderRadius),
    ),
    selectedIconTheme: IconThemeData(color: colorScheme.onSurface),
    unselectedIconTheme: IconThemeData(
      color: colorScheme.onSurface.withOpacity(0.6),
    ),
  );
}
