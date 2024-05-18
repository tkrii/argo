import 'package:example/core/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Radios extends StatelessWidget {
  const Radios({super.key});

  @override
  Widget build(BuildContext context) {
    RxString selectedType = RxString('1');
    return ExpansionTile(
      leading: const PhosphorIcon(PhosphorIconsRegular.radioButton),
      title: Text(LocaleKeys.radio.tr),
      children: <Widget>[
        Obx(
          () => RadioListTile<String>(
            value: '1',
            groupValue: selectedType.value,
            title: Text('${LocaleKeys.radio.tr} 1'),
            onChanged: (String? value) => selectedType.value = value ?? '',
          ),
        ),
        Obx(
          () => RadioListTile<String>(
            value: '2',
            groupValue: selectedType.value,
            title: Text('${LocaleKeys.radio.tr} 2'),
            onChanged: (String? value) => selectedType.value = value ?? '',
          ),
        ),
        Obx(
          () => RadioListTile<String>(
            value: '2',
            groupValue: selectedType.value,
            title: Text('${LocaleKeys.radio.tr} 3'),
            onChanged: null,
          ),
        ),
      ],
    );
  }
}
