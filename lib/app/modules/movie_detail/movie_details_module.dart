import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/movie_data_source.dart';
import 'data/repositories/movie_repository_impl.dart';
import 'domain/usecases/get_movie_details_use_case.dart';
import 'domain/usecases/get_similar_movies_use_case.dart';
import 'presentation/cubit/movie_details_cubit.dart';
import 'presentation/pages/movie_details_page.dart';

class MovieDetailsModule extends Module {
  static const routeName = '/movie-details';
  static const routePath = routeName;
  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => MovieDataSourceImpl(
            dio: i(),
            appNetwork: i(),
          ),
        ),
        Bind((i) => MovieRepositoryImpl(i())),
        Bind((i) => GetMovieDetailsUseCase(i())),
        Bind((i) => GetSimilarMoviesUseCase(i())),
        Bind.lazySingleton(
          (i) => MovieDetailsCubit(
            getMovieDetailsUseCase: i(),
            getSimilarMoviesUseCase: i(),
            params: MovieDetailsCubitParams(movie: i.args.data),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const MovieDetailsPage(),
        ),
        ChildRoute(
          MovieDetailsPage.routeName,
          child: (context, args) => const MovieDetailsPage(),
        ),
      ];
}
