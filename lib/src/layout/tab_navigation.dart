part of '../themes/scheme.dart';

TabBarTheme _tabBarTheme(ColorScheme colorScheme) {
  return TabBarTheme(
    indicatorColor: colorScheme.primary,
    dividerColor: colorScheme.outline,
    labelColor: colorScheme.primary,
    unselectedLabelColor: colorScheme.onSurface,
    overlayColor: WidgetStateColor.resolveWith(
      (states) => colorScheme.outlineVariant.withOpacity(1 / 3),
    ),
    indicatorSize: TabBarIndicatorSize.label,
  );
}

NavigationRailThemeData _navigationRailThemeData(ColorScheme colorScheme) {
  return NavigationRailThemeData(
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
    selectedIconTheme: IconThemeData(color: colorScheme.primary),
    unselectedIconTheme: IconThemeData(color: colorScheme.onSurface),
  );
}
