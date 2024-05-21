part of '../themes/scheme_theme.dart';

ListTileThemeData _listTileThemeData(ColorScheme colorScheme) {
  TextStyle textStyle = createTextTheme(colorScheme.onSurface).titleSmall!;
  return ListTileThemeData(
    dense: kIsMobile,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kBorderRadius),
    ),
    selectedTileColor: colorScheme.surfaceContainerLowest,
    selectedColor: colorScheme.onSurface,
    titleTextStyle: textStyle,
    subtitleTextStyle: textStyle.copyWith(
      color: colorScheme.onSurface.withOpacity(0.6),
      fontSize: 0.75 * rem,
    ),
    leadingAndTrailingTextStyle: textStyle.copyWith(
      color: colorScheme.onSurface.withOpacity(0.6),
      fontSize: 0.75 * rem,
    ),
    iconColor: colorScheme.onSurface.withOpacity(0.6),
  );
}

IconThemeData _iconThemeData(ColorScheme colorScheme) => IconThemeData(
      size: 1.5 * rem,
      color: colorScheme.onSurface.scale(alpha: -0.2),
    );
