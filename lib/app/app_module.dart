import 'package:flutter_modular/flutter_modular.dart';

import 'modules/movie_detail/presentation/movie_details_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: MovieDetailsModule())
  ];
}
