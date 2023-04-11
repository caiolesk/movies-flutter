import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/movie_detail/presentation/movie_details_module.dart';
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
      module: MovieDetailsModule(),
    ),
  ];
}
