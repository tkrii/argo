part of '../themes/scheme.dart';

DialogTheme _dialogTheme(ColorScheme colorScheme) {
  return DialogTheme(
    backgroundColor: colorScheme.surfaceContainer,
    shadowColor: colorScheme.shadow,
    barrierColor: colorScheme.shadow.scale(alpha: -0.375),
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kBorderRadius),
    ),
    iconColor: colorScheme.muted,
    /*
    black:
    rgba(mix($black, $zinc-950), 0.75)};

    light:
    {rgba(mix($zinc-100, $zinc-50), 0.75)};
     */
  );
}
