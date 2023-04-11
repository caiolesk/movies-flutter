class AppNetwork {
  final String _baseUrl = 'https://api.themoviedb.org/3/';
  final String apiKey = '468131cccdfc0754786fda8ed67a3fae';

  String get getMovieDetails => '${_baseUrl}movie/';
  String get getSimilarMovies => '/similar/';
}
