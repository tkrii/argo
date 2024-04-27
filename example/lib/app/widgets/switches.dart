import 'package:example/core/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Switches extends StatelessWidget {
  const Switches({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool switch1 = RxBool(false);
    return ExpansionTile(
      leading: const PhosphorIcon(PhosphorIconsRegular.toggleLeft),
      title: Text(LocaleKeys.switchText.tr),
      children: <Widget>[
        Obx(
          () => SwitchListTile(
              value: switch1.value,
              title: Text('${LocaleKeys.switchText.tr} 1'),
              subtitle: Text(LocaleKeys.subtitle.tr),
              onChanged: (bool value) => switch1.value = value),
        ),
        Obx(
          () => SwitchListTile(
            value: switch1.value,
            title: Text('${LocaleKeys.switchText.tr} 2'),
            subtitle: Text(LocaleKeys.subtitle.tr),
            onChanged: null,
          ),
        ),
      ],
    );
  }
}
