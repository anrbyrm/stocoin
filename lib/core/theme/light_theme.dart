import 'package:flutter/material.dart';
import 'package:stocoin/core/bootstrap/helpers.dart';

import 'package:stocoin/core/theme/styles/styles.dart';
import 'package:stocoin/core/theme/text/default_text_theme.dart';

ThemeData? lightTheme(ColorStyles? lightColors) {
  final lightTheme = getAppTextTheme(
    TextStyle(fontFamily: getEnv('APP_FONT') as String),
    defaultTextTheme.merge(_lightTextTheme(lightColors)),
  );

  return ThemeData(
    primaryColor: lightColors!.primary,
    scaffoldBackgroundColor: lightColors.scaffold,
    textTheme: lightTheme,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: lightColors.scaffold,
      titleTextStyle:
          lightTheme.headline6!.copyWith(fontWeight: FontWeight.w600),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: lightColors.primary,
      selectionColor: lightColors.primary,
      selectionHandleColor: lightColors.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: lightColors.textFieldHintTextColor,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: lightColors.primary),
      ),
      hintStyle: TextStyle(color: lightColors.textFieldHintTextColor),
    ),
  );
}

TextTheme _lightTextTheme(ColorStyles? lightColors) {
  final lightPrimary = lightColors!.accent;
  return TextTheme(
    headline6: TextStyle(
      color: lightPrimary,
    ),
    headline5: TextStyle(
      color: lightPrimary,
    ),
    headline4: TextStyle(
      color: lightPrimary,
    ),
    headline3: TextStyle(
      color: lightPrimary,
    ),
    headline2: TextStyle(
      color: lightPrimary,
    ),
    headline1: TextStyle(
      color: lightPrimary,
    ),
    subtitle2: TextStyle(
      color: lightPrimary,
    ),
    subtitle1: TextStyle(
      color: lightPrimary,
    ),
    overline: TextStyle(
      color: lightPrimary,
    ),
    button: TextStyle(
      color: lightPrimary.withOpacity(0.8),
    ),
    bodyText2: TextStyle(
      color: lightPrimary.withOpacity(0.8),
    ),
    bodyText1: TextStyle(
      color: lightPrimary,
    ),
    caption: TextStyle(
      color: lightPrimary,
    ),
  );
}
