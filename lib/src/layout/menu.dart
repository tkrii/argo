part of '../themes/scheme_theme.dart';

MenuStyle _menuStyle(ColorScheme colorScheme) => MenuStyle(
      backgroundColor: WidgetStatePropertyAll(
        colorScheme.surfaceContainer,
      ),
      elevation: const WidgetStatePropertyAll(2),
    );

MenuThemeData _menuThemeData(ColorScheme colorScheme) => MenuThemeData(
      style: _menuStyle(colorScheme),
    );

MenuBarThemeData _menuBarThemeData(ColorScheme colorScheme) => MenuBarThemeData(
      style: _menuStyle(colorScheme),
    );
