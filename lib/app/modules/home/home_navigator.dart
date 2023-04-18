import 'package:flutter_modular/flutter_modular.dart';

import '../movie_detail/domain/entities/movie.dart';
import '../movie_detail/presentation/pages/movie_details_page.dart';

class HomeNavigator {
  void openMovieDetails(Movie movie) {
    Modular.to.pushNamed(
      MovieDetailsPage.routePath,
      arguments: movie,
    );
  }
}
