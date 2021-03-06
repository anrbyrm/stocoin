import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:stocoin/core/bootstrap/app.dart';
import 'package:stocoin/core/config/app_localization.dart';
import 'package:stocoin/core/localization/app_localization.dart';
import 'package:stocoin/injectable.dart';

Future<void> main() async {
  await dotenv.load();
  await Localization.instance.init(
    languageCode: languageCode,
    valuesAsMap: valuesAsMap,
  );

  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const App(
      mode: ThemeMode.system,
      locale: Locale('en'),
      supportedLocales: [Locale('en')],
    ),
  );
}
