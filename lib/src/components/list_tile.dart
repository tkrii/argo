part of '../themes/scheme.dart';

ListTileThemeData _listTileThemeData(ColorScheme colorScheme) {
  TextStyle textStyle = createTextTheme(colorScheme.onSurface).titleSmall!;
  return ListTileThemeData(
    dense: kIsMobile,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kBorderRadius),
    ),
    selectedColor: colorScheme.onSecondary,
    selectedTileColor: colorScheme.secondary,
    titleTextStyle: textStyle,
    subtitleTextStyle: textStyle.copyWith(
      color: colorScheme.muted,
      fontSize: 0.75 * rem,
    ),
    iconColor: colorScheme.muted,
  );
}
