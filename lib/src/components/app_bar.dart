part of '../themes/scheme.dart';

AppBarTheme _appBarTheme(ColorScheme colorScheme) {
  return AppBarTheme(
    foregroundColor: colorScheme.isLight ? ArgoColors.black : ArgoColors.white,
    backgroundColor: colorScheme.surfaceContainerHighest,
    elevation: 0,
    shape: Border(
      bottom: BorderSide(
        color: colorScheme.outlineVariant,
        strokeAlign: -1,
      ),
    ),
    iconTheme: kIconThemeData(colorScheme.isDark),
    centerTitle: true,
    systemOverlayStyle: colorScheme.isLight
        ? SystemUiOverlayStyle.light.copyWith(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: ArgoColors.transparent,
            systemNavigationBarColor: colorScheme.surfaceContainerHighest,
            systemNavigationBarDividerColor: colorScheme.outline,
            systemNavigationBarIconBrightness: Brightness.dark,
          )
        : SystemUiOverlayStyle.dark.copyWith(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: ArgoColors.transparent,
            systemNavigationBarColor: colorScheme.surfaceContainerHighest,
            systemNavigationBarDividerColor: colorScheme.outline,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
  );
}
