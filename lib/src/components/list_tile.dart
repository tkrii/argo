part of '../themes/scheme_theme.dart';

ListTileThemeData _listTileThemeData(ColorScheme colorScheme) {
  return ListTileThemeData(
    selectedTileColor: colorScheme.surfaceContainerLowest,
    selectedColor: colorScheme.onSurface,
    iconColor: colorScheme.onSurface.withOpacity(0.6),
  );
}

IconThemeData _iconThemeData(ColorScheme colorScheme) => IconThemeData(
      color: colorScheme.onSurface.scale(alpha: -0.2),
    );
