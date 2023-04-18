import 'package:flutter_modular/flutter_modular.dart';

import '../movie_detail/movie_details_module.dart';
import 'data/datasources/home_data_source.dart';
import 'data/repositories/home_repository_impl.dart';
import 'domain/repositories/home_repository.dart';
import 'domain/usecases/get_trending_movies_use_case.dart';
import 'home_navigator.dart';
import 'presentation/cubits/home_cubit.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module {
  static const routeName = '/home';
  static const routePath = routeName;

  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => HomeDataSourceImpl(
            appNetwork: i(),
            dio: i(),
          ),
        ),
        Bind(
          (i) => HomeRepositoryImpl(dataSource: i()),
        ),
        Bind(
          (i) => GetTrendingMoviesUseCase(repository: i()),
        ),
        Bind((i) => HomeNavigator()),
        Bind(
          (i) => HomeCubit(
            getTrendingMoviesUseCase: i(),
            homeNavigator: i(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const HomePage(),
        ),
        ChildRoute(
          HomePage.routeName,
          child: (context, args) => const HomePage(),
        ),
      ];
}
