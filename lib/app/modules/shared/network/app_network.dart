class AppNetwork {
  final String _baseUrl = 'https://api.themoviedb.org/3/movie/';
  final String _apiKey = '468131cccdfc0754786fda8ed67a3fae';

  String get apiKeyPath => '?api_key=$_apiKey';
  String get getMovieDetails => '$_baseUrl/movie/';
  String get getSimilarMovies => '/similar/';
}
