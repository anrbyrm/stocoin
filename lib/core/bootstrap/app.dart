import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:stocoin/core/bootstrap/navigation_service.dart';
import 'package:stocoin/core/config/app_constants.dart';
import 'package:stocoin/core/config/app_theme.dart';
import 'package:stocoin/core/localization/app_localization.dart';
import 'package:stocoin/features/login/presentation/cubit/login_cubit.dart';
import 'package:stocoin/injectable.dart';

class App extends HookWidget {
  const App({
    this.locale,
    this.mode,
    this.supportedLocales,
    Key? key,
  }) : super(key: key);

  final Locale? locale;
  final ThemeMode? mode;
  final List<Locale>? supportedLocales;

  @override
  Widget build(BuildContext context) {
    return Localized(
      ValueListenableBuilder<Locale>(
        valueListenable: ValueNotifier(locale ?? Localization.instance.locale!),
        builder: (context, locale, _) => MultiBlocProvider(
          providers: [BlocProvider(create: (context) => di<LoginCubit>())],
          child: MaterialApp(
            theme: light().theme,
            locale: locale,
            themeMode: mode,
            darkTheme: dark().theme,
            debugShowCheckedModeBanner: false,
            navigatorKey: di<NavigationService>().navigatorKey,
            onGenerateRoute: di<NavigationService>().generateRoute,
            initialRoute: loginPath,
            supportedLocales:
                supportedLocales ?? Localization.instance.locals(),
            localizationsDelegates: Localization.instance.delegates,
          ),
        ),
      ),
    );
  }
}
