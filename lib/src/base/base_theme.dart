import 'dart:io';

import 'package:argo/argo.dart'
    show
        ArgoColorExtension,
        ArgoColorSchemeExtension,
        ArgoColors,
        ArgoPageTransitionsTheme,
        ArnaColorsExtension;
import 'package:flutter/cupertino.dart' show CupertinoThemeData;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';
import 'text_theme.dart';

part 'widgets/badge.dart';
part 'widgets/banner.dart';
part 'widgets/bars.dart';
part 'widgets/buttons.dart';
part 'widgets/chip.dart';
part 'widgets/dialogs.dart';
part 'widgets/form_buttons.dart';
part 'widgets/form_inputs.dart';
part 'widgets/navigations.dart';
part 'widgets/pickers.dart';
part 'widgets/progress.dart';
part 'widgets/tiles.dart';

bool get isMobile =>
    !kIsWeb && (Platform.isAndroid || Platform.isIOS || Platform.isFuchsia);

/// Helper function to create a new Argo theme
ThemeData createArgoTheme({
  required ColorScheme colorScheme,
  Color? elevatedButtonColor,
  Color? elevatedButtonTextColor,
}) {
  final textTheme = createTextTheme(colorScheme.onSurface);
  return ThemeData.from(
    colorScheme: colorScheme,
    useMaterial3: true,
  ).copyWith(
    appBarTheme: _createAppBarTheme(colorScheme),
    applyElevationOverlayColor: colorScheme.isDark,
    badgeTheme: _createBadgeTheme(colorScheme),
    bannerTheme: _createMaterialBannerTheme(colorScheme),
    brightness: colorScheme.brightness,
    bottomAppBarTheme: _createBottomAppBarTheme(colorScheme),
    bottomNavigationBarTheme: _createBottomNavigationTheme(colorScheme),
    bottomSheetTheme: _createBottomSheetTheme(colorScheme),
    buttonTheme: _buttonThemeData,
    canvasColor: colorScheme.surfaceTint,
    cardColor: colorScheme.surface,
    cardTheme: _createCardTheme(colorScheme),
    checkboxTheme: _createCheckBoxTheme(colorScheme),
    chipTheme: _createChipTheme(
      selectedColor: elevatedButtonColor ?? colorScheme.tertiary,
      colorScheme: colorScheme,
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: colorScheme.primary,
      brightness: colorScheme.brightness,
      primaryContrastingColor: colorScheme.primary,
      barBackgroundColor: colorScheme.surfaceVariant,
      scaffoldBackgroundColor: colorScheme.background,
    ),
    datePickerTheme: _createDatePickerTheme(colorScheme),
    dialogBackgroundColor: colorScheme.surface,
    dialogTheme: _createDialogTheme(colorScheme),
    disabledColor: colorScheme.outlineVariant,
    dividerColor: colorScheme.outline,
    dividerTheme: DividerThemeData(
      color: colorScheme.outline,
      space: 1.0,
      thickness: 0.0,
    ),
    drawerTheme: _createDrawerTheme(colorScheme),
    iconTheme: IconThemeData(
      color: colorScheme.onSurface,
      size: isMobile ? kComfortableIconSize : kCompactIconSize,
    ),
    dropdownMenuTheme: _createDropdownMenuTheme(colorScheme),
    elevatedButtonTheme: _createElevatedButtonTheme(colorScheme),
    expansionTileTheme: _createExpansionTheme(colorScheme),
    filledButtonTheme: _createFilledButtonTheme(colorScheme),
    floatingActionButtonTheme:
        _createFloatingActionButtonTheme(colorScheme, elevatedButtonColor),
    iconButtonTheme: _createIconButtonTheme(colorScheme),
    indicatorColor: colorScheme.primaryContainer,
    inputDecorationTheme: _createInputDecorationTheme(colorScheme),
    listTileTheme: _createTileTheme(colorScheme),
    menuBarTheme: _createMenuBarTheme(colorScheme),
    menuButtonTheme: _createMenuItemTheme(colorScheme, textTheme),
    menuTheme: _createMenuTheme(colorScheme),
    navigationBarTheme: _createNavigationBarTheme(colorScheme),
    navigationDrawerTheme: _createNavigationDrawerTheme(colorScheme),
    navigationRailTheme: _createNavigationRailTheme(colorScheme),
    outlinedButtonTheme: _createOutlinedButtonTheme(colorScheme),
    pageTransitionsTheme: ArgoPageTransitionsTheme.horizontal,
    popupMenuTheme: _createPopupMenuTheme(colorScheme),
    primaryColor: colorScheme.primary,
    primaryColorDark: colorScheme.isDark ? colorScheme.primary : null,
    primaryColorLight: colorScheme.isLight ? colorScheme.primary : null,
    primaryIconTheme: IconThemeData(color: colorScheme.onSurface),
    progressIndicatorTheme: _createProgressIndicatorTheme(colorScheme),
    radioTheme: _createRadioTheme(colorScheme),
    scaffoldBackgroundColor: colorScheme.background,
    scrollbarTheme: _createScrollBarTheme(colorScheme),
    searchBarTheme: _createSearchBarTheme(colorScheme),
    searchViewTheme: _createSearchViewTheme(colorScheme),
    secondaryHeaderColor: colorScheme.surfaceVariant,
    segmentedButtonTheme: _createSegmentedButtonTheme(colorScheme),
    shadowColor: ArgoColors.barrierColor,
    sliderTheme: _createSliderTheme(colorScheme),
    snackBarTheme: _createSnackBarTheme(colorScheme),
    splashFactory: isMobile ? null : NoSplash.splashFactory,
    switchTheme: _createSwitchTheme(colorScheme),
    tabBarTheme: _createTabBarTheme(colorScheme),
    textButtonTheme: _createTextButtonTheme(colorScheme),
    textSelectionTheme: _createTextSelectionTheme(colorScheme),
    textTheme: textTheme,
    timePickerTheme: _createTimePickerTheme(colorScheme),
    toggleButtonsTheme: _createToggleButtonsTheme(colorScheme),
    tooltipTheme: _tooltipThemeData,
  );
}
