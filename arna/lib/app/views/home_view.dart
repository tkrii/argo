import 'package:example/app/controllers/base_controller.dart';
import 'package:example/app/views/search_view.dart';
import 'package:example/app/views/settings_view.dart';
import 'package:example/core/i18n/i18n.dart';
import 'package:example/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeView extends GetView<BaseController> {
  const HomeView({super.key});

  @override
  String? get tag => 'main';

  @override
  Widget build(BuildContext context) {
    List<NavigationRailDestination> navigationRailDestinations(
        List<(String, PhosphorIconData, PhosphorIconData?, Widget)>
            destinations) {
      List<NavigationRailDestination> railDestination = [];

      for (var data in destinations) {
        NavigationRailDestination destination = NavigationRailDestination(
          icon: PhosphorIcon(data.$2),
          selectedIcon: PhosphorIcon(data.$3 ?? data.$2),
          label: Text(data.$1.tr),
        );
        railDestination.add(destination);
      }

      return railDestination;
    }

    List<NavigationDestination> navigationDestination(
        List<(String, PhosphorIconData, PhosphorIconData?, Widget)>
            destinations) {
      List<NavigationDestination> barDestination = [];

      for (var data in destinations) {
        NavigationDestination destination = NavigationDestination(
          icon: PhosphorIcon(data.$2),
          selectedIcon: PhosphorIcon(data.$3 ?? data.$2),
          label: data.$1.tr,
        );
        barDestination.add(destination);
      }

      return barDestination;
    }

    SearchAnchor searchAnchor = SearchAnchor(
      searchController: controller.searchController,
      isFullScreen: context.isPhone,
      builder: (context, searchController) => IconButton(
        tooltip: LocaleKeys.search.tr,
        icon: const PhosphorIcon(PhosphorIconsDuotone.magnifyingGlass),
        onPressed: () => searchController.openView(),
      ),
      suggestionsBuilder: searchView,
    );

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: controller.homeIndexNavigation.value + 1 !=
                  controller.screens.length
              ? searchAnchor
              : null,
          title: Text(LocaleKeys.appName.tr),
          actions: [
            IconButton(
              tooltip: LocaleKeys.about.tr,
              onPressed: () => Get.dialog(
                AboutDialog(
                  applicationIcon: const FlutterLogo(),
                  applicationName: LocaleKeys.appName.tr,
                  applicationVersion: LocaleKeys.version.tr,
                ),
              ),
              icon: const PhosphorIcon(PhosphorIconsDuotone.info),
            ),
            IconButton(
              tooltip: LocaleKeys.settings.tr,
              onPressed: () => context.isPhone
                  ? Get.toNamed(AppRoutes.settings)
                  : Get.dialog(
                      const SettingsView(),
                    ),
              icon: const PhosphorIcon(PhosphorIconsDuotone.gear),
            ),
          ],
        ),
        body: Row(
          children: [
            Visibility(
              visible: controller.railNavigation.value,
              child: NavigationRail(
                onDestinationSelected: (destination) =>
                    controller.homeIndexNavigation.value = destination,
                destinations: navigationRailDestinations(controller.screens),
                selectedIndex: controller.homeIndexNavigation.value,
                labelType: NavigationRailLabelType.selected,
              ),
            ),
            Visibility(
              visible: controller.railNavigation.value,
              child: const VerticalDivider(),
            ),
            Expanded(
              child:
                  controller.screens[controller.homeIndexNavigation.value].$4,
            ),
          ],
        ),
        bottomNavigationBar: Obx(
          () => Visibility(
            visible: !controller.railNavigation.value,
            child: NavigationBar(
              selectedIndex: controller.homeIndexNavigation.value,
              destinations: navigationDestination(controller.screens),
              onDestinationSelected: (destination) =>
                  controller.homeIndexNavigation.value = destination,
            ),
          ),
        ),
      ),
    );
  }
}
