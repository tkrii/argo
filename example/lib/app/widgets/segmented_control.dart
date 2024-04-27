import 'package:example/core/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SegmentedControl extends StatelessWidget {
  const SegmentedControl({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt segmentedControlGroupValue = RxInt(0);
    return ExpansionTile(
      leading: const PhosphorIcon(
        PhosphorIconsRegular.squareSplitHorizontal,
      ),
      title: Text(
        LocaleKeys.segmentedControl.tr,
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => SegmentedButton<int>(
              segments: const <ButtonSegment<int>>[
                ButtonSegment<int>(
                  value: 0,
                  label: PhosphorIcon(PhosphorIconsDuotone.numberSquareOne),
                ),
                ButtonSegment<int>(
                  value: 1,
                  label: PhosphorIcon(PhosphorIconsDuotone.numberSquareTwo),
                ),
                ButtonSegment<int>(
                  value: 2,
                  label: PhosphorIcon(PhosphorIconsDuotone.numberSquareThree),
                ),
              ],
              selected: <int>{segmentedControlGroupValue.value},
              onSelectionChanged: (Set<int> value) =>
                  segmentedControlGroupValue.value = value.first,
            ),
          ),
        ),
      ],
    );
  }
}
