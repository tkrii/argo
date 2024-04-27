import 'package:example/app/widgets/banners.dart';
import 'package:example/app/widgets/buttons.dart';
import 'package:example/app/widgets/checkbox.dart';
import 'package:example/app/widgets/indicators.dart';
import 'package:example/app/widgets/list_tile.dart';
import 'package:example/app/widgets/pickers.dart';
import 'package:example/app/widgets/radios.dart';
import 'package:example/app/widgets/segmented_control.dart';
import 'package:example/app/widgets/sliders.dart';
import 'package:example/app/widgets/switches.dart';
import 'package:example/app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';

class WidgetsView extends StatelessWidget {
  const WidgetsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const Buttons().paddingAll(8),
        const SegmentedControl().paddingAll(8),
        const CheckBoxes().paddingAll(8),
        const Radios().paddingAll(8),
        const Switches().paddingAll(8),
        const ListTiles().paddingAll(8),
        const Sliders().paddingAll(8),
        const Indicators().paddingAll(8),
        const TextBox().paddingAll(8),
        const Banners().paddingAll(8),
        const Pickers().paddingAll(8),
      ],
    );
  }
}
