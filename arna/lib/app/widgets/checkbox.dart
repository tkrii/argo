import 'package:example/core/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CheckBoxes extends StatelessWidget {
  const CheckBoxes({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool checkBox1 = RxBool(false);
    return ExpansionTile(
      leading: const PhosphorIcon(PhosphorIconsRegular.checkSquare),
      title: Text(LocaleKeys.checkBox.tr),
      children: <Widget>[
        Obx(
          () => CheckboxListTile(
            value: checkBox1.value,
            title: const Text('${LocaleKeys.checkBox} 1'),
            onChanged: (bool? value) => checkBox1.value = value!,
          ),
        ),
        Obx(
          () => CheckboxListTile(
            value: checkBox1.value,
            title: Text('${LocaleKeys.checkBox.tr} 2'),
            subtitle: Text(LocaleKeys.subtitle.tr),
            onChanged: null,
          ),
        ),
      ],
    );
  }
}
