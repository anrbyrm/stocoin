import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:stocoin/core/config/app_theme.dart';
import 'package:stocoin/core/localization/app_localization.dart';

class App extends HookWidget {
  const App({
    this.locale,
    this.mode,
    this.theme,
    this.supportedLocales,
    Key? key,
  }) : super(key: key);

  final Locale? locale;
  final ThemeMode? mode;
  final ThemeData? theme;
  final List<Locale>? supportedLocales;

  @override
  Widget build(BuildContext context) {
    return Localized(
      ValueListenableBuilder<Locale>(
        valueListenable: ValueNotifier(locale ?? Localization.instance.locale!),
        builder: (context, locale, _) => MaterialApp(
          theme: theme,
          locale: locale,
          themeMode: mode,
          darkTheme: dark().theme,
          debugShowCheckedModeBanner: false,
          supportedLocales: supportedLocales ?? Localization.instance.locals(),
          localizationsDelegates: Localization.instance.delegates,
        ),
      ),
    );
  }
}
