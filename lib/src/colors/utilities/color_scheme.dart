import 'package:argo/argo.dart';
import 'package:flutter/material.dart';

extension ArgoColorScheme on ColorScheme {
  /// Whether the brightness is dark.
  bool get isDark => brightness == Brightness.dark;

  /// Whether the brightness is light.
  bool get isLight => brightness == Brightness.light;
/// Link Argo Color
  Color get link => ArgoColors.from(brightness).link;
/// Destructive Argo Color
  Color get destructive => ArgoColors.from(brightness).destructive;
/// Warning Argo Color
  Color get warning => ArgoColors.from(brightness).warning;
/// Success Argo Color
  Color get success => ArgoColors.from(brightness).success;
}
