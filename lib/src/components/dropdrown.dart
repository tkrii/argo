part of '../themes/scheme.dart';

DropdownMenuThemeData _dropdownMenuThemeData(ColorScheme colorScheme, ArgoColorTheme colorTheme) =>
    DropdownMenuThemeData(
      menuStyle: _menuStyle(colorScheme),
      inputDecorationTheme: _inputDecorationTheme(colorScheme, colorTheme),
    );

PopupMenuThemeData _popupMenuThemeData(ColorScheme colorScheme) => PopupMenuThemeData(
      color: colorScheme.surfaceContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      elevation: 1,
      labelTextStyle: WidgetStatePropertyAll(
        createTextTheme(colorScheme.onSurface).labelLarge!,
      ),
    );
