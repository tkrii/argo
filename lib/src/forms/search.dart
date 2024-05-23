part of '../themes/scheme_theme.dart';

SearchBarThemeData _searchBarThemeData(ColorScheme colorScheme) {
  return SearchBarThemeData(
    elevation: WidgetStateProperty.resolveWith(
      (state) {
        if (state.contains(WidgetState.disabled)) {
          return 0;
        } else {
          return 5;
        }
      },
    ),
    backgroundColor: WidgetStateProperty.resolveWith(
      (state) {
        if (state.contains(WidgetState.disabled)) {
          return _disabled(colorScheme.surfaceContainerHighest);
        } else {
          return colorScheme.surfaceContainerHighest;
        }
      },
    ),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBigBorderRadius),
      ),
    ),
  );
}

SearchViewThemeData _searchViewThemeData(ColorScheme colorScheme) {
  return SearchViewThemeData(
    backgroundColor: colorScheme.surfaceContainer,
    elevation: 5,
    dividerColor: colorScheme.outline,
  );
}
