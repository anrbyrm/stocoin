import 'dart:ui';

import 'package:stocoin/core/theme/styles/styles.dart';

class LightThemeColors implements ColorStyles {
  @override
  Color get accent => const Color(0xFF101018);

  @override
  Color get primary => black;

  @override
  Color get scaffold => white;

  // entry screen colors
  @override
  Color get entryButtonColor => const Color(0xFF0066FF);

  @override
  Color get entryButtonInnerShadowColor => white;

  // text field
  @override
  Color get textFieldHintTextColor => const Color(0xFF969AA0);

  @override
  Color get textFieldSuffixIconBgColor => const Color(0xFFF4F6F9);

  @override
  Color get textFieldSuffixIconColor => const Color(0xFF23262F);
}
