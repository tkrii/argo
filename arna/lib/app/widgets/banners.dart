import 'package:example/core/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Banners extends StatelessWidget {
  const Banners({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: const PhosphorIcon(PhosphorIconsRegular.deviceMobile),
      title: Text(LocaleKeys.banners.tr),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            child: Text(LocaleKeys.showBanner.tr),
            onPressed: () {
              ScaffoldMessenger.of(context).showMaterialBanner(
                MaterialBanner(
                  content: ListTile(
                    title: Text(LocaleKeys.bannerTitle.tr),
                    subtitle: Text(LocaleKeys.subtitle.tr),
                  ),
                  actions: <Widget>[
                    CloseButton(
                      onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            child: Text(LocaleKeys.showSnackBar.tr),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(LocaleKeys.hello.tr),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            child: Text('show-dialog'.tr),
            onPressed: () {
              Get.dialog(
                const AlertDialog(
                  title: Text('dialog title'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
