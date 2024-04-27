import 'package:get/get_navigation/src/root/internacionalization.dart';

import 'en_us.dart';
import 'es_mx.dart';

class I18n implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'es_mx': esMX,
        'en_us': enUS,
      };
}

class LocaleKeys {
  LocaleKeys._();
  static const String appName = 'appName';
  static const String version = 'version';
  static const String argo = 'argo';
  static const String about = 'about';
  static const String settings = 'settings';
  static const String hello = 'hello';
  static const String add = 'add';
  static const String search = 'search';
  static const String widgets = 'widgets';
  static const String typography = 'typography';
  static const String tabs = 'tabs';
  static const String tab = 'tab';
  static const String closedTab = 'closedTab';
  static const String buttonPushed = 'buttonPushed';
  static const String theme = 'theme';
  static const String system = 'system';
  static const String dark = 'dark';
  static const String light = 'light';
  static const String options = 'options';
  static const String railMode = 'railMode';
  static const String accent = 'accent';
  static const String lorem = 'lorem';
  static const String bannerTitle = 'bannerTitle';
  static const String buttons = 'buttons';
  static const String first = 'first';
  static const String second = 'second';
  static const String third = 'third';
  static const String selected = 'selected';
  static const String linkedButtons = 'linkedButtons';
  static const String segmentedControl = 'segmentedControl';
  static const String checkBox = 'checkBox';
  static const String subtitle = 'subtitle';
  static const String radio = 'radio';
  static const String switchText = 'switchText';
  static const String listTile = 'listTile';
  static const String title = 'title';
  static const String slider = 'slider';
  static const String indicator = 'indicator';
  static const String textField = 'textField';
  static const String banners = 'banners';
  static const String showBanner = 'showBanner';
  static const String showSnackBar = 'showSnackBar';
  static const String pickers = 'pickers';
  static const String datePicker = 'datePicker';
  static const String timePicker = 'timePicker';
}
