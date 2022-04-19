import 'package:flutter/material.dart';

import 'package:stocoin/core/theme/styles/styles.dart';

class BaseThemeConfig {
  final String? id;
  final String? description;
  final ThemeData? theme;
  final ColorStyles? colors;

  BaseThemeConfig({
    required this.id,
    required this.description,
    required this.theme,
    required this.colors,
  });
}
