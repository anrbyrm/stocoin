import 'package:flutter/material.dart';

import 'package:stocoin/core/config/app_constants.dart';
import 'package:stocoin/core/ui/transition.dart';
import 'package:stocoin/features/login/presentation/pages/login_page.dart';
import 'package:stocoin/features/register/presentation/pages/register_page.dart';

class NavigationService {
  NavigationService._();

  static NavigationService instance = NavigationService._();

  final navigatorKey = GlobalKey<NavigatorState>();

  Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/register':
        return OpacityPageRoute<Widget>(
          duration: const Duration(milliseconds: globalDuration),
          currentPage: arguments! as Widget,
          builder: (_) => const RegisterPage(),
        );
      default:
        return MaterialPageRoute(builder: (_) => const LoginPage());
    }
  }

  Future<void> navigateTo(String? path, {dynamic arguments}) async =>
      navigatorKey.currentState!.pushNamed(path!, arguments: arguments);

  Future<void> popAllAndNavigateTo(String? path, {dynamic arguments}) async =>
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
        path!,
        (route) => false,
        arguments: arguments,
      );

  Future<void> replace(String? path, {dynamic arguments}) async =>
      navigatorKey.currentState!
          .pushReplacementNamed(path!, arguments: arguments);

  void goBack() => navigatorKey.currentState!.pop();
}
