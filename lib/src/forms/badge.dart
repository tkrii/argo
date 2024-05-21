part of '../themes/scheme_theme.dart';

BadgeThemeData _badgeThemeData(ColorScheme colorScheme) => BadgeThemeData(
      backgroundColor: colorScheme.tertiary,
      textColor: colorScheme.onTertiary,
      smallSize: rem,
    );
