import 'package:argo/argo.dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => ArgoTheme(
          data: AppTheme.of(context).copyWith(),
          child: const HomePage(),
        ),
      ),
    );
  }
}

class AppTheme {
  static ArgoThemeData of(BuildContext context) {
    return SharedAppData.getValue(
      context,
      'theme',
      () => const ArgoThemeData(),
    );
  }

  static void apply(
    BuildContext context, {
    ArgoVariant? variant,
    ThemeMode? themeMode,
  }) {
    SharedAppData.setValue(
      context,
      'theme',
      AppTheme.of(context).copyWith(
        themeMode: themeMode,
        variant: variant,
        useMaterial3: true,
      ),
    );
  }
}
