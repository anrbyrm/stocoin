import 'package:flutter/material.dart';

import 'package:stocoin/core/bootstrap/helpers.dart';
import 'package:stocoin/core/theme/styles/styles.dart';
import 'package:stocoin/core/theme/text/default_text_theme.dart';

ThemeData darkTheme(ColorStyles? darkColors) {
  final darkTheme = getAppTextTheme(
    TextStyle(fontFamily: getEnv('APP_FONT') as String),
    defaultTextTheme.merge(_darkTextTheme(darkColors)),
  );

  return ThemeData(
    primaryColor: darkColors!.primary,
    scaffoldBackgroundColor: darkColors.scaffold,
    textTheme: darkTheme,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: darkColors.scaffold,
      titleTextStyle:
          darkTheme.headline6!.copyWith(fontWeight: FontWeight.w600),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: darkColors.primary,
      selectionColor: darkColors.primary,
      selectionHandleColor: darkColors.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: darkColors.textFieldHintTextColor,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: darkColors.primary),
      ),
      hintStyle: TextStyle(color: darkColors.textFieldHintTextColor),
    ),
  );
}

TextTheme _darkTextTheme(ColorStyles? darkColors) {
  final darkPrimary = darkColors!.accent;
  return TextTheme(
    headline6: TextStyle(
      color: darkPrimary.withOpacity(0.8),
    ),
    headline5: TextStyle(
      color: darkPrimary,
    ),
    headline4: TextStyle(
      color: darkPrimary,
    ),
    headline3: TextStyle(
      color: darkPrimary,
    ),
    headline2: TextStyle(
      color: darkPrimary,
    ),
    headline1: TextStyle(
      color: darkPrimary,
    ),
    subtitle2: TextStyle(
      color: darkPrimary,
    ),
    subtitle1: TextStyle(
      color: darkPrimary,
    ),
    overline: TextStyle(
      color: darkPrimary,
    ),
    button: TextStyle(
      color: darkPrimary.withOpacity(0.8),
    ),
    bodyText2: TextStyle(
      color: darkPrimary.withOpacity(0.8),
    ),
    bodyText1: TextStyle(
      color: darkPrimary,
    ),
    caption: TextStyle(
      color: darkPrimary.withOpacity(0.8),
    ),
  );
}
