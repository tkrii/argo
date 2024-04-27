import 'package:example/core/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Sliders extends StatelessWidget {
  const Sliders({super.key});

  @override
  Widget build(BuildContext context) {
    RxDouble sliderValue1 = RxDouble(0);
    return ExpansionTile(
      leading: const PhosphorIcon(PhosphorIconsRegular.slidersHorizontal),
      title: Text(LocaleKeys.slider.tr),
      children: <Widget>[
        Obx(
          () => Slider(
            value: sliderValue1.value,
            max: 100,
            onChanged: (double newValue) => sliderValue1.value = newValue,
          ).paddingAll(16),
        ),
        Obx(
          () => Slider(
            value: sliderValue1.value,
            max: 100,
            onChanged: null,
          ).paddingAll(16),
        ),
      ],
    );
  }
}
