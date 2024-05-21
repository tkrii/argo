import 'package:argo/argo.dart';
import 'package:example/app/views/hello_view.dart';
import 'package:example/app/views/typography_view.dart';
import 'package:example/app/views/widgets_view.dart';
import 'package:example/core/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BaseController extends GetxController {
  Rx<ThemeMode> theme = Rx(ThemeMode.system);
  RxBool railNavigation = RxBool(false);
  RxInt homeIndexNavigation = RxInt(0);
  Rx<ArgoVariant> variant = Rx(ArgoVariant.blue);

  SearchController searchController = SearchController();

  List<(String, PhosphorIconData, PhosphorIconData?, Widget)> screens = [
    (
      LocaleKeys.hello,
      PhosphorIconsRegular.smiley,
      PhosphorIconsDuotone.smiley,
      const HelloView(),
    ),
    (
      LocaleKeys.widgets,
      PhosphorIconsRegular.diamondsFour,
      PhosphorIconsDuotone.diamondsFour,
      const WidgetsView(),
    ),
    (
      LocaleKeys.typography,
      PhosphorIconsRegular.textAa,
      PhosphorIconsDuotone.textAa,
      const TypographyView(),
    ),
  ];

  @override
  void onInit() {
    everAll(
      [theme, variant],
      (callback) => update(),
    );
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BaseController>(
      BaseController(),
      tag: 'main',
    );
  }
}
