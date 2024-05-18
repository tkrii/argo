import 'package:example/core/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HelloView extends StatelessWidget {
  const HelloView({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt helloPushedButton = RxInt(0);
    return Scaffold(
      body: Center(
        child: Card(
          child: Obx(
            () => SelectableText(
              LocaleKeys.buttonPushed.trArgs([helloPushedButton.value.toString()]),
            ).paddingSymmetric(horizontal: 16),
          ),
        ).paddingAll(32),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => helloPushedButton++,
        child: const PhosphorIcon(PhosphorIconsRegular.handTap),
      ),
    );
  }
}
