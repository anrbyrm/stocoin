import 'package:flutter/material.dart';

import 'package:stocoin/core/theme/styles/styles.dart';

ThemeData? lightTheme(ColorStyles? lightColors) {
  return ThemeData(
    primaryColor: lightColors!.primary,
    scaffoldBackgroundColor: lightColors.scaffold,
  );
}
