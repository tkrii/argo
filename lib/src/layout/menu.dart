part of '../themes/scheme_theme.dart';

MenuStyle _menuStyle(ColorScheme colorScheme) => MenuStyle(
      backgroundColor: WidgetStatePropertyAll(
        colorScheme.surfaceContainer,
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
      ),
      elevation: const WidgetStatePropertyAll(2),
      side: WidgetStatePropertyAll(
        BorderSide(
          color: colorScheme.outline,
          width: kBorderWidth,
        ),
      ),
    );

MenuThemeData _menuThemeData(ColorScheme colorScheme) => MenuThemeData(
      style: _menuStyle(colorScheme),
    );

MenuBarThemeData _menuBarThemeData(ColorScheme colorScheme) => MenuBarThemeData(
      style: _menuStyle(colorScheme),
    );
