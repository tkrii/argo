part of '../base_theme.dart';

ListTileThemeData _createTileTheme(ColorScheme colorScheme) {
  return ListTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kWindowRadius),
    ),
    tileColor: Colors.transparent,
    selectedTileColor: colorScheme.surfaceTint,
    selectedColor: colorScheme.onSurface,
    leadingAndTrailingTextStyle: createTextTheme(
      colorScheme.secondaryText,
    ).bodySmall,
    subtitleTextStyle: createTextTheme(
      colorScheme.secondaryText,
    ).bodySmall,
  );
}

ExpansionTileThemeData _createExpansionTheme(ColorScheme colorScheme) {
  return ExpansionTileThemeData(
    backgroundColor: colorScheme.surface,
    collapsedBackgroundColor: colorScheme.surfaceVariant,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: colorScheme.outline),
      borderRadius: BorderRadius.circular(kWindowRadius),
    ),
    collapsedShape: RoundedRectangleBorder(
      side: BorderSide(color: colorScheme.outline),
      borderRadius: BorderRadius.circular(kWindowRadius),
    ),
  );
}
