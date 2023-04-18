import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/movie_detail/movie_details_module.dart';
import 'modules/shared/network/app_network.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => Dio()),
        Bind.singleton((i) => AppNetwork()),
      ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Modular.initialRoute,
      module: LoginModule(),
    ),
    ModuleRoute(
      LoginModule.routeName,
      module: LoginModule(),
    ),
    ModuleRoute(
      HomeModule.routeName,
      module: HomeModule(),
    ),
    ModuleRoute(
      MovieDetailsModule.routeName,
      module: MovieDetailsModule(),
    ),
  ];
}
