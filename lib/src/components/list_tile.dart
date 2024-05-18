part of '../themes/scheme.dart';

ListTileThemeData _listTileThemeData(ColorScheme colorScheme) {
  TextStyle textStyle = createTextTheme(colorScheme.onSurface).titleSmall!;
  return ListTileThemeData(
    dense: kIsMobile,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kBorderRadius),
    ),
    selectedColor: colorScheme.secondary.foregroundBrightColor,
    selectedTileColor: colorScheme.secondary,
    titleTextStyle: textStyle,
    subtitleTextStyle: textStyle.copyWith(
      color: colorScheme.outlineVariant,
      fontSize: 0.75 * rem,
    ),
    leadingAndTrailingTextStyle: textStyle.copyWith(
      color: colorScheme.outlineVariant,
      fontSize: 0.75 * rem,
    ),
    iconColor: colorScheme.outlineVariant,
  );
}

IconThemeData _iconThemeData(ColorScheme colorScheme) => IconThemeData(
      size: 1.5 * rem,
      color: colorScheme.outlineVariant,
    );
