import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:stocoin/core/config/app_theme.dart';
import 'package:stocoin/core/theme/styles/styles.dart';

dynamic getEnv(String? key, {dynamic defaultValue}) {
  if (!dotenv.env.containsKey(key) && defaultValue != null) {
    return defaultValue;
  }

  final value = dotenv.env[key];

  if (value == 'null' || value == null) {
    return null;
  }

  if (value.toLowerCase() == 'true') {
    return true;
  }

  if (value.toLowerCase() == 'false') {
    return false;
  }

  return value;
}

TextTheme getAppTextTheme(TextStyle? appThemeFont, TextTheme? textTheme) {
  return TextTheme(
    headline1: appThemeFont!.merge(textTheme!.headline1),
    headline2: appThemeFont.merge(textTheme.headline2),
    headline3: appThemeFont.merge(textTheme.headline3),
    headline4: appThemeFont.merge(textTheme.headline4),
    headline5: appThemeFont.merge(textTheme.headline5),
    headline6: appThemeFont.merge(textTheme.headline6),
    subtitle1: appThemeFont.merge(textTheme.subtitle1),
    subtitle2: appThemeFont.merge(textTheme.subtitle2),
    bodyText1: appThemeFont.merge(textTheme.bodyText1),
    bodyText2: appThemeFont.merge(textTheme.bodyText2),
    caption: appThemeFont.merge(textTheme.caption),
    button: appThemeFont.merge(textTheme.button),
    overline: appThemeFont.merge(textTheme.overline),
  );
}

ColorStyles get(BuildContext? context) {
  return Theme.of(context!).brightness == Brightness.light
      ? light().colors!
      : dark().colors!;
}

extension ColorsHelper on TextStyle {
  TextStyle? setColor(
    BuildContext context,
    Color Function(ColorStyles? color) newColor,
  ) {
    return copyWith(color: newColor(get(context)));
  }
}
