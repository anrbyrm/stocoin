import 'dart:ui';

import 'package:stocoin/core/theme/styles/styles.dart';

class DarkThemeColors implements ColorStyles {
  @override
  Color get accent => white;

  @override
  Color get primary => const Color(0xFF0066FF);

  @override
  Color get scaffold => const Color(0xFF101018);

  // entry screen colors
  @override
  Color get entryButtonColor => const Color(0xFF0066FF);

  @override
  Color get entryButtonInnerShadowColor => white;

  // text field
  @override
  Color get textFieldHintTextColor => const Color(0xFF969AA0);

  @override
  Color get textFieldSuffixIconBgColor => const Color(0xFF3E436D);

  @override
  Color get textFieldSuffixIconColor => const Color(0xFF969AA0);
}
