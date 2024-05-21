import 'package:flutter/services.dart';

extension ArgoBrightness on Brightness {
  Brightness get inverse =>
      this == Brightness.light ? Brightness.dark : Brightness.light;
}
