part of '../themes/scheme.dart';

AppBarTheme _appBarTheme(ColorScheme colorScheme) => AppBarTheme(
      foregroundColor: colorScheme.isLight ? ArgoColors.black : ArgoColors.white,
      backgroundColor: colorScheme.surfaceContainerLow,
      shape: Border(
        bottom: BorderSide(
          color: colorScheme.outline,
          width: kBorderWidth,
        ),
      ),
      iconTheme: _iconThemeData(colorScheme).copyWith(
        color: colorScheme.surface.foregroundBrightColor,
      ),
      elevation: 1,
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
