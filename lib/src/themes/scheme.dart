import 'package:argo/argo.dart';
import 'package:argo/src/themes/styles.dart';
import 'package:argo/src/themes/text_theme.dart';
import 'package:argo/src/themes/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;

part '../components/app_bar.dart';
part '../components/banner.dart';
part '../components/card.dart';
part '../components/dropdrown.dart';
part '../components/expansion_list_tile.dart';
part '../components/list_tile.dart';
part '../components/progress.dart';
part '../components/tooltip.dart';
part '../content/buttons.dart';
part '../content/datetime.dart';
part '../content/dialog.dart';
part '../forms/badge.dart';
part '../forms/buttons.dart';
part '../forms/chip.dart';
part '../forms/field.dart';
part '../forms/search.dart';
part '../forms/slider.dart';
part '../layout/bottom_navigation.dart';
part '../layout/drawer_navigation.dart';
part '../layout/menu.dart';
part '../layout/tab_navigation.dart';

ThemeData createArgoTheme({
  required ColorScheme colorScheme,
  required ArgoColorTheme colorTheme,
}) {
  return ThemeData.from(
    colorScheme: colorScheme,
    useMaterial3: true,
  ).copyWith(
    textTheme: createTextTheme(colorScheme.onSurface),
    scaffoldBackgroundColor: colorScheme.surface,
    brightness: colorScheme.brightness,
    expansionTileTheme: _expansionTileThemeData(colorScheme, colorTheme),
    cardTheme: _cardTheme(colorScheme),
    cardColor: colorScheme.surfaceContainer,
    dialogTheme: _dialogTheme(colorScheme),
    dialogBackgroundColor: colorScheme.surfaceContainerHigh,
    appBarTheme: _appBarTheme(colorScheme),
    progressIndicatorTheme: _progressIndicatorThemeData(colorScheme, colorTheme),
    sliderTheme: _sliderThemeData(colorScheme, colorTheme),
    tooltipTheme: _tooltipTheme(colorScheme),
    filledButtonTheme: _filledButtonThemeData(colorScheme, colorTheme),
    outlinedButtonTheme: _outlinedButtonThemeData(colorScheme, colorTheme),
    elevatedButtonTheme: _elevatedButtonThemeData(colorScheme, colorTheme),
    floatingActionButtonTheme: _floatingActionButtonThemeData(colorScheme, colorTheme),
    textButtonTheme: _textButtonThemeData(colorScheme, colorTheme),
    checkboxTheme: _checkboxThemeData(colorScheme, colorTheme),
    radioTheme: _radioThemeData(colorScheme, colorTheme),
    switchTheme: _switchThemeData(colorScheme, colorTheme),
    inputDecorationTheme: _inputDecorationTheme(colorScheme, colorTheme),
    textSelectionTheme: _textSelectionThemeData(colorScheme, colorTheme),
    bannerTheme: _materialBannerThemeData(colorScheme),
    badgeTheme: _badgeThemeData(colorScheme),
    listTileTheme: _listTileThemeData(colorScheme),
    snackBarTheme: _snackBarThemeData(colorScheme),
    menuTheme: _menuThemeData(colorScheme),
    menuBarTheme: _menuBarThemeData(colorScheme),
    menuButtonTheme: _menuButtonThemeData(colorScheme, colorTheme),
    dropdownMenuTheme: _dropdownMenuThemeData(colorScheme, colorTheme),
    popupMenuTheme: _popupMenuThemeData(colorScheme),
    segmentedButtonTheme: _segmentedButtonThemeData(colorScheme, colorTheme),
    searchBarTheme: _searchBarThemeData(colorScheme),
    searchViewTheme: _searchViewThemeData(colorScheme),
    toggleButtonsTheme: _toggleButtonsThemeData(colorScheme, colorTheme),
    chipTheme: _chipThemeData(colorScheme, colorTheme),
    dividerColor: colorScheme.outlineVariant,
    datePickerTheme: _datePickerThemeData(colorScheme, colorTheme),
    timePickerTheme: _timePickerThemeData(colorScheme, colorTheme),
    tabBarTheme: _tabBarTheme(colorScheme),
    bottomAppBarTheme: _bottomAppBarTheme(colorScheme),
    bottomNavigationBarTheme: _bottomNavigationTheme(colorScheme),
    navigationBarTheme: _navigationBarTheme(colorScheme),
    drawerTheme: _drawerTheme(colorScheme),
    navigationDrawerTheme: _navigationDrawerTheme(colorScheme),
    navigationRailTheme: _navigationRailThemeData(colorScheme),
  );
}
