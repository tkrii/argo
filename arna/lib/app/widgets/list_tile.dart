import 'package:example/core/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ListTiles extends StatelessWidget {
  const ListTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: const PhosphorIcon(PhosphorIconsRegular.listDashes),
      title: Text(LocaleKeys.listTile.tr),
      children: <Widget>[
        ListTile(
          title: Text('${LocaleKeys.title.tr} 1'),
          subtitle: Text(LocaleKeys.subtitle.tr),
          trailing: const Badge(
            label: Text('1'),
          ),
        ),
        ListTile(
          title: Text('${LocaleKeys.title.tr} 2'),
          subtitle: Text(LocaleKeys.subtitle.tr),
          trailing: const Badge(label: Text('2')),
          enabled: false,
        ),
      ],
    );
  }
}
