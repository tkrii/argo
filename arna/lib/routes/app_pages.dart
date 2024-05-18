import 'package:example/app/views/home_view.dart';
import 'package:example/app/views/settings_view.dart';
import 'package:example/routes/app_routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  AppPages._();

  static String initial = AppRoutes.home;

  static List<GetPage> pages = <GetPage>[
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsView(),
    ),
  ];
}
