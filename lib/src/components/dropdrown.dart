part of '../themes/scheme.dart';

DropdownMenuThemeData _dropdownMenuThemeData(ColorScheme colorScheme, ArgoColorTheme colorTheme) {
  return DropdownMenuThemeData(
    textStyle: createTextTheme(colorScheme.onSurface).labelLarge!,
    menuStyle: _menuStyle(colorScheme),
    inputDecorationTheme: _inputDecorationTheme(colorScheme, colorTheme),
  );
}

PopupMenuThemeData _popupMenuThemeData(ColorScheme colorScheme) {
  return PopupMenuThemeData(
    color: colorScheme.surfaceContainer,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kBorderRadius),
    ),
    shadowColor: colorScheme.shadow,
    elevation: 2,
    iconSize: rem * 1.5,
  );
}
