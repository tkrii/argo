import 'package:argo/argo.dart';
import 'package:example/app/controllers/base_controller.dart';
import 'package:example/core/i18n/i18n.dart';
import 'package:example/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<BaseController>(
        init: BaseController(),
        tag: 'main',
        builder: (controller) => GetMaterialApp(
          title: 'Argo Theme Example',

          /// translations
          translations: I18n(),
          locale: Get.deviceLocale,
          fallbackLocale: Get.fallbackLocale,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('es', 'MX'),
            Locale('en', 'US'),
          ],

          /// routes
          initialRoute: AppPages.initial,
          getPages: AppPages.pages,

          /// customization
          themeMode: controller.theme.value,
          theme: controller.variant.value.theme,
          darkTheme: controller.variant.value.darkTheme,
          highContrastTheme: argoHighContrastLight,
          highContrastDarkTheme: argoHighContrastDark,
        ),
      );
}
