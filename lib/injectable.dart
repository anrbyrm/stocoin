import 'package:get_it/get_it.dart';

import 'package:stocoin/core/bootstrap/navigation_service.dart';

final di = GetIt.instance;

void setupLocator() {
  di.registerFactory<NavigationService>(() => NavigationService.instance);
}
