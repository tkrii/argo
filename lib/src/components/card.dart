part of '../themes/scheme_theme.dart';

CardTheme _cardTheme(ColorScheme colorScheme) => CardTheme(
      color: colorScheme.surfaceContainer,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
    );
