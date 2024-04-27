import 'package:example/core/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Indicators extends StatelessWidget {
  const Indicators({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: const PhosphorIcon(PhosphorIconsRegular.spinnerGap),
      title: Text(LocaleKeys.indicator.tr),
      children: <Widget>[
        const CircularProgressIndicator.adaptive().paddingAll(8),
        const LinearProgressIndicator().paddingAll(16),
      ],
    );
  }
}
