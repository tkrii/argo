part of '../themes/scheme_theme.dart';

AppBarTheme _appBarTheme(ColorScheme colorScheme) => AppBarTheme(
      foregroundColor: colorScheme.onSurface,
      backgroundColor: colorScheme.surfaceContainerHigh,
      shape: Border(
        bottom: BorderSide(
          color: colorScheme.outline,
          width: kBorderWidth,
        ),
      ),
      iconTheme: _iconThemeData(colorScheme).copyWith(
        color: colorScheme.onSurface,
      ),
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: colorScheme.isLight
          ? SystemUiOverlayStyle.light.copyWith(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: ArgoColors.transparent,
            )
          : SystemUiOverlayStyle.dark.copyWith(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: ArgoColors.transparent,
            ),
      titleTextStyle: createTextTheme(colorScheme.onSurfaceVariant).titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 1.25 * rem,
          ),
    );
