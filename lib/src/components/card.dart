part of '../themes/scheme.dart';

CardTheme _cardTheme(ColorScheme colorScheme) => CardTheme(
      color: colorScheme.surfaceContainer,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
    );
