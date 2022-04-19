import 'package:flutter/material.dart';

import 'package:stocoin/core/bootstrap/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const App(
      mode: ThemeMode.system,
      locale: Locale('en'),
      supportedLocales: [Locale('en')],
    ),
  );
}
