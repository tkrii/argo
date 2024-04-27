import 'package:example/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Fabs extends StatelessWidget {
  const Fabs({super.key});

  @override
  Widget build(BuildContext context) {
    void onPressed() => ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Yay! ❤️ for Argo')));

    return Wrap(
      spacing: kWrapSpacing,
      runSpacing: kWrapSpacing,
      children: [
        FloatingActionButton(
          onPressed: onPressed,
          child: const Icon(Ionicons.add),
        ),
        FloatingActionButton.extended(
          onPressed: onPressed,
          label: const Text('Yay! +1 ❤️ for Argo'),
        ),
        FloatingActionButton.small(
          onPressed: onPressed,
          child: const Icon(Ionicons.add),
        ),
        FloatingActionButton.large(
          onPressed: onPressed,
          child: const Icon(Ionicons.add),
        ),
      ],
    );
  }
}
