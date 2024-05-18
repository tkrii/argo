part of '../themes/scheme.dart';

DialogTheme _dialogTheme(ColorScheme colorScheme) => DialogTheme(
      backgroundColor: colorScheme.surfaceContainer,
      barrierColor: colorScheme.shadow.scale(alpha: -0.375),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      iconColor: colorScheme.outline,
      alignment: kIsMobile ? Alignment.bottomCenter : null,
      titleTextStyle: createTextTheme(colorScheme.onSurfaceVariant).titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 1.125 * rem,
          ),
      shadowColor: colorScheme.isDark
          ? ArgoColors.black.mix(ArgoColors.zinc.shade950, 75).withOpacity(0.375)
          : ArgoColors.zinc.shade100.mix(ArgoColors.zinc.shade50, 75).withOpacity(0.375),
      /*
    black:
    rgba(mix($black, $zinc-950), 0.75)};

    light:
    {rgba(mix($zinc-100, $zinc-50), 0.75)};
     */
    );
