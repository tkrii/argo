import 'package:example/core/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Pickers extends StatelessWidget {
  const Pickers({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: const PhosphorIcon(PhosphorIconsRegular.calendar),
      title: Text(LocaleKeys.pickers.tr),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () async {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year - 5),
                lastDate: DateTime(DateTime.now().year + 5),
              ).then(
                (DateTime? value) {
                  if (value != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('${value.year}/${value.month}/${value.day}'),
                      ),
                    );
                  }
                  return null;
                },
              );
            },
            child: Text(MaterialLocalizations.of(context).dateInputLabel),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () async {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ).then(
                (TimeOfDay? value) {
                  if (value != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${value.hour}:${value.minute}'),
                      ),
                    );
                  }
                  return null;
                },
              );
            },
            child:
                Text(MaterialLocalizations.of(context).timePickerInputHelpText),
          ),
        ),
      ],
    );
  }
}
