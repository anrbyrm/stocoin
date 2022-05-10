import 'package:get_it/get_it.dart';

import 'package:stocoin/core/bootstrap/navigation_service.dart';
import 'package:stocoin/features/login/presentation/cubit/login_cubit.dart';

final di = GetIt.instance;

void setupLocator() {
  di
    ..registerFactory<NavigationService>(() => NavigationService.instance)
    ..registerFactory<LoginCubit>(() => LoginCubit());
}
