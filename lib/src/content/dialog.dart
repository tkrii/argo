part of '../themes/scheme_theme.dart';

DialogTheme _dialogTheme(ColorScheme colorScheme) => DialogTheme(
      backgroundColor: colorScheme.surfaceContainer,
      elevation: 4,
      iconColor: colorScheme.onSurface.scale(alpha: -0.2),
    );
