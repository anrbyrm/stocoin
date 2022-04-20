import 'package:flutter/material.dart';

import 'package:stocoin/core/bootstrap/app.dart';
import 'package:stocoin/core/config/app_localization.dart';
import 'package:stocoin/core/localization/app_localization.dart';

Future<void> main() async {
  Localization.instance.init(
    languageCode: languageCode,
    valuesAsMap: valuesAsMap,
  );

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const App(
      mode: ThemeMode.system,
      locale: Locale('en'),
      supportedLocales: [Locale('en')],
    ),
  );
}
