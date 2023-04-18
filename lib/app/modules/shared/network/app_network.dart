class AppNetwork {
  final String _baseUrl = 'https://api.themoviedb.org/3/';
  final String apiKey = '468131cccdfc0754786fda8ed67a3fae';

  String get getMovieDetails => '${_baseUrl}movie/';
  String get getTrendingMovies => '${_baseUrl}trending/movie/day';
  String get getSimilarMovies => '/similar';
}
