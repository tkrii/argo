part of '../themes/scheme.dart';

DialogTheme _dialogTheme(ColorScheme colorScheme) {
  return DialogTheme(
    backgroundColor: colorScheme.surfaceContainerHigh,
    surfaceTintColor: colorScheme.surface,
    shadowColor: colorScheme.isLight ? ArgoColors.slate.shade400 : ArgoColors.black.mix(ArgoColors.slate.shade950),
    elevation: 6,
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
