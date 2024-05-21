part of '../themes/scheme_theme.dart';

DropdownMenuThemeData _dropdownMenuThemeData(ColorScheme colorScheme) => DropdownMenuThemeData(
      menuStyle: _menuStyle(colorScheme),
      inputDecorationTheme: _inputDecorationTheme(colorScheme),
    );

PopupMenuThemeData _popupMenuThemeData(ColorScheme colorScheme) => PopupMenuThemeData(
      iconColor: colorScheme.isLight ? const Color(0xff323232) : ArgoColors.white,
      color: colorScheme.surfaceContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
    );
