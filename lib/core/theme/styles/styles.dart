import 'package:flutter/material.dart';

abstract class ColorStyles {
  // general
  Color get scaffold;
  Color get primary;
  Color get accent;

  /// entry
  Color get entryButtonColor;
  Color get entryButtonInnerShadowColor;
  Color get textFieldHintTextColor;
  Color get textFieldSuffixIconColor;
  Color get textFieldSuffixIconBgColor;
}

const black = Color(0xFF000000);
const white = Color(0xFFFFFFFF);
