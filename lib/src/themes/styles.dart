import 'dart:io';

import 'package:flutter/foundation.dart';

bool kIsMobile =
    !kIsWeb && (Platform.isAndroid || Platform.isIOS || Platform.isFuchsia);

double rem = kIsMobile ? 16 : 15;
double kSmallSpacing = 0.75 * rem;
double kSpacing = rem;
double kBorderRadius = 0.5 * rem;
double kBorderWidth = 0.0625 * rem;
double kBorderOutline = 0.125 * rem;
double kBigBorderRadius = 5 * rem;
