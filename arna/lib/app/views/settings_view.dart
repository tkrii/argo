import 'package:argo/argo.dart';
import 'package:example/app/controllers/base_controller.dart';
import 'package:example/core/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SettingsView extends GetView<BaseController> {
  const SettingsView({super.key});

  @override
  String? get tag => 'main';

  @override
  Widget build(BuildContext context) {
    Widget body = SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Card.outlined(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(LocaleKeys.theme.tr).paddingSymmetric(vertical: 8, horizontal: 16),
                ...ThemeMode.values.map<Widget>(
                  (ThemeMode tm) => Obx(
                    () => RadioListTile<ThemeMode>(
                      value: tm,
                      groupValue: controller.theme.value,
                      title: Text(tm.name.tr),
                      onChanged: (_) => controller.theme.value = tm,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card.outlined(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(LocaleKeys.accent.tr).paddingSymmetric(vertical: 8, horizontal: 16),
                Wrap(
                  children: ArgoVariant.values
                      .map<Widget>(
                        (ArgoVariant av) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Obx(
                            () => IconButton(
                              icon: controller.variant.value == av
                                  ? const PhosphorIcon(PhosphorIconsDuotone.checkCircle)
                                  : const PhosphorIcon(PhosphorIconsDuotone.circle),
                              onPressed: () => controller.variant.value = av,
                              style: IconButton.styleFrom(
                                backgroundColor: av.accent,
                                foregroundColor: controller.variant.value == av ? av.accent.foreground : av.accent,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          Card.outlined(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(LocaleKeys.options.tr).paddingSymmetric(vertical: 8, horizontal: 16),
                Obx(
                  () => SwitchListTile(
                    title: const Text('Rail navigation mode'),
                    value: controller.railNavigation.value,
                    onChanged: (_) => controller.railNavigation.toggle(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return context.isPhone
        ? Scaffold(
            appBar: AppBar(
              title: Text(LocaleKeys.settings.tr),
            ),
            body: body,
          )
        : Dialog(
            child: body,
          );
  }
}
