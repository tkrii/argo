import 'package:example/core/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = <String>[
      LocaleKeys.first.tr,
      LocaleKeys.second.tr,
      LocaleKeys.third.tr,
    ];

    final RxString dropdownValue = RxString(LocaleKeys.first.tr);

    return ExpansionTile(
      leading: const PhosphorIcon(PhosphorIconsRegular.handTap),
      title: Text(LocaleKeys.buttons.tr),
      children: <Widget>[
        const Text('OutlinedButton'),
        Wrap(
          children: <Widget>[
            IconButton.outlined(
              icon: const PhosphorIcon(PhosphorIconsRegular.plus),
              onPressed: () {},
              tooltip: LocaleKeys.add.tr,
            ).paddingAll(8),
            IconButton.outlined(
              icon: const PhosphorIcon(PhosphorIconsRegular.plus),
              onPressed: null,
              tooltip: LocaleKeys.add.tr,
            ).paddingAll(8),
            OutlinedButton(
              child: Text(LocaleKeys.add.tr),
              onPressed: () {},
            ).paddingAll(8),
            OutlinedButton.icon(
              label: Text(LocaleKeys.add.tr),
              icon: const PhosphorIcon(PhosphorIconsRegular.plus),
              onPressed: () {},
            ).paddingAll(8),
            OutlinedButton.icon(
              icon: const PhosphorIcon(PhosphorIconsRegular.plus),
              onPressed: null,
              label: Text(LocaleKeys.add.tr),
            ).paddingAll(8),
          ],
        ),
        const Text('ElevatedButton'),
        Wrap(
          children: <Widget>[
            IconButton(
              icon: const PhosphorIcon(PhosphorIconsRegular.plus),
              onPressed: () {},
              tooltip: LocaleKeys.add.tr,
            ).paddingAll(8),
            IconButton(
              icon: const PhosphorIcon(PhosphorIconsRegular.plus),
              onPressed: null,
              tooltip: LocaleKeys.add.tr,
            ).paddingAll(8),
            ElevatedButton(
              child: Text(LocaleKeys.add.tr),
              onPressed: () {},
            ).paddingAll(8),
            ElevatedButton.icon(
              label: Text(LocaleKeys.add.tr),
              icon: const PhosphorIcon(PhosphorIconsRegular.plus),
              onPressed: () {},
            ).paddingAll(8),
            ElevatedButton.icon(
              icon: const PhosphorIcon(PhosphorIconsRegular.plus),
              onPressed: null,
              label: Text(LocaleKeys.add.tr),
            ).paddingAll(8),
          ],
        ),
        const Text('FilledButton'),
        Wrap(
          children: <Widget>[
            IconButton.filled(
              icon: const PhosphorIcon(PhosphorIconsRegular.plus),
              onPressed: () {},
              tooltip: LocaleKeys.add.tr,
            ).paddingAll(8),
            IconButton.filled(
              icon: const PhosphorIcon(PhosphorIconsRegular.plus),
              onPressed: null,
              tooltip: LocaleKeys.add.tr,
            ).paddingAll(8),
            IconButton.filledTonal(
              icon: const PhosphorIcon(PhosphorIconsRegular.plus),
              onPressed: () {},
              tooltip: LocaleKeys.add.tr,
            ).paddingAll(8),
            IconButton.filledTonal(
              icon: const PhosphorIcon(PhosphorIconsRegular.plus),
              onPressed: null,
              tooltip: LocaleKeys.add.tr,
            ).paddingAll(8),
            FilledButton(
              child: Text(LocaleKeys.add.tr),
              onPressed: () {},
            ).paddingAll(8),
            FilledButton.icon(
              label: Text(LocaleKeys.add.tr),
              icon: const PhosphorIcon(PhosphorIconsRegular.plus),
              onPressed: () {},
            ).paddingAll(8),
            FilledButton.icon(
              icon: const PhosphorIcon(PhosphorIconsRegular.plus),
              onPressed: null,
              label: Text(LocaleKeys.add.tr),
            ).paddingAll(8),
          ],
        ),
        const Text('FloatingActionButtonButton'),
        Wrap(
          children: [
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(PhosphorIconsRegular.plus),
            ).paddingAll(8),
            FloatingActionButton.extended(
              onPressed: () {},
              label: const Text('Yay! +1 ❤️ for Argo'),
            ).paddingAll(8),
            FloatingActionButton.small(
              onPressed: () {},
              child: const Icon(PhosphorIconsRegular.plus),
            ).paddingAll(8),
            FloatingActionButton.large(
              onPressed: () {},
              child: const Icon(PhosphorIconsRegular.plus),
            ).paddingAll(8),
          ],
        ),
        const Text('TextButton'),
        Wrap(
          children: [
            TextButton(
              child: Text(LocaleKeys.add.tr),
              onPressed: () {},
            ).paddingAll(8),
            TextButton.icon(
              label: Text(LocaleKeys.add.tr),
              icon: const PhosphorIcon(PhosphorIconsRegular.plus),
              onPressed: () {},
            ).paddingAll(8),
            TextButton.icon(
              icon: const PhosphorIcon(PhosphorIconsRegular.plus),
              onPressed: null,
              label: Text(LocaleKeys.add.tr),
            ).paddingAll(8),
          ],
        ),
        const Text('other buttons'),
        Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PopupMenuButton<String>(
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: LocaleKeys.first.tr,
                    child: Text(LocaleKeys.first.tr),
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            '${LocaleKeys.selected.tr} ${LocaleKeys.first.tr}'),
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: LocaleKeys.second.tr,
                    child: Text(LocaleKeys.second.tr),
                  ),
                  const PopupMenuDivider(),
                  PopupMenuItem<String>(
                    value: LocaleKeys.third.tr,
                    child: Text(LocaleKeys.third.tr),
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            '${LocaleKeys.selected.tr} ${LocaleKeys.third.tr}'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => DropdownButton<String>(
                  value: dropdownValue.value,
                  items: items.map((String items) {
                    return DropdownMenuItem<String>(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${LocaleKeys.selected.tr} $newValue'),
                      ),
                    );
                    dropdownValue.value = newValue!;
                  },
                ),
              ),
            ),
            Obx(
              () => DropdownMenu<String>(
                initialSelection: dropdownValue.value,
                dropdownMenuEntries: items
                    .map<DropdownMenuEntry<String>>(
                      (e) => DropdownMenuEntry<String>(
                        value: e,
                        label: e,
                      ),
                    )
                    .toList(),
                onSelected: (newValue) => dropdownValue.value = newValue!,
              ).marginAll(8),
            ),
          ],
        ),
      ],
    );
  }
}
