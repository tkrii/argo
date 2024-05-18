part of '../themes/scheme.dart';

BadgeThemeData _badgeThemeData(ColorScheme colorScheme) => BadgeThemeData(
      backgroundColor: colorScheme.tertiary,
      textColor: colorScheme.tertiary.foregroundBrightColor,
      smallSize: rem,
    );
