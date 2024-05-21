part of '../themes/scheme_theme.dart';

DialogTheme _dialogTheme(ColorScheme colorScheme) => DialogTheme(
      backgroundColor: colorScheme.surfaceContainer,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      iconColor: colorScheme.onSurface.scale(alpha: -0.2),
      alignment: kIsMobile ? Alignment.bottomCenter : null,
      titleTextStyle: createTextTheme(colorScheme.onSurfaceVariant).titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 1.125 * rem,
          ),
    );
