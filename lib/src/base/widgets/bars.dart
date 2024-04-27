part of '../base_theme.dart';

AppBarTheme _createAppBarTheme(ColorScheme colorScheme) {
  return AppBarTheme(
    shape: Border(
      bottom: BorderSide(
        color: colorScheme.outline,
        strokeAlign: -1,
      ),
    ),
    systemOverlayStyle: colorScheme.isLight
        ? SystemUiOverlayStyle.light.copyWith(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: ArgoColors.transparent,
            systemNavigationBarColor: colorScheme.surfaceVariant,
            systemNavigationBarDividerColor: colorScheme.outline,
            systemNavigationBarIconBrightness: Brightness.dark,
          )
        : SystemUiOverlayStyle.dark.copyWith(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: ArgoColors.transparent,
            systemNavigationBarColor: colorScheme.surfaceVariant,
            systemNavigationBarDividerColor: colorScheme.outline,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
    backgroundColor: colorScheme.surfaceVariant,
    foregroundColor: colorScheme.onSurfaceVariant,
    elevation: 0,
    titleTextStyle:
        createTextTheme(colorScheme.onSurfaceVariant).titleMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
    iconTheme: IconThemeData(
      color: colorScheme.onSurfaceVariant,
    ),
    actionsIconTheme: IconThemeData(color: colorScheme.onSurfaceVariant),
  );
}

BottomAppBarTheme _createBottomAppBarTheme(ColorScheme colorScheme) {
  return BottomAppBarTheme(
    color: colorScheme.surfaceVariant,
    elevation: 6,
    shadowColor: ArgoColors.barrierColor,
  );
}

MenuBarThemeData _createMenuBarTheme(ColorScheme colorScheme) {
  return MenuBarThemeData(
    style: _createMenuStyle(colorScheme),
  );
}

MenuButtonThemeData _createMenuItemTheme(
  ColorScheme colorScheme,
  TextTheme textTheme,
) {
  return MenuButtonThemeData(
    style: ButtonStyle(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      alignment: Alignment.center,
      textStyle: MaterialStateProperty.all(textTheme.bodyMedium),
    ),
  );
}

SearchBarThemeData _createSearchBarTheme(ColorScheme colorScheme) {
  return SearchBarThemeData(
    shadowColor: MaterialStateProperty.all(ArgoColors.barrierColor),
    elevation: MaterialStateProperty.resolveWith((state) {
      if (state.contains(MaterialState.disabled)) {
        return 0;
      } else {
        return 6;
      }
    }),
    backgroundColor: MaterialStateProperty.resolveWith((state) {
      if (state.contains(MaterialState.disabled)) {
        return colorScheme.outlineVariant.withOpacity(0.1);
      } else {
        return colorScheme.surfaceTint;
      }
    }),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kWindowRadius),
      ),
    ),
  );
}

SearchViewThemeData _createSearchViewTheme(ColorScheme colorScheme) {
  return SearchViewThemeData(
    backgroundColor: colorScheme.surface,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: colorScheme.outline),
      borderRadius: BorderRadius.circular(kWindowRadius),
    ),
  );
}

TabBarTheme _createTabBarTheme(ColorScheme colorScheme) {
  return TabBarTheme(
    indicatorColor: colorScheme.primary,
    dividerColor: colorScheme.outline,
    labelColor: colorScheme.primary,
    unselectedLabelColor: colorScheme.secondaryText,
    overlayColor: MaterialStateColor.resolveWith(
      (states) => colorScheme.outlineVariant.withOpacity(1 / 3),
    ),
    indicatorSize: TabBarIndicatorSize.label,
  );
}
