import 'package:flutter/material.dart';

import 'package:stocoin/core/theme/styles/styles.dart';

ThemeData darkTheme(ColorStyles? darkColors) {
  // TextTheme darkTheme = getAppTextTheme(, textTheme)

  return ThemeData(
    primaryColor: darkColors!.primary,
    scaffoldBackgroundColor: darkColors.scaffold,
  );
}
