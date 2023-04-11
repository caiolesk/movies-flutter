class Movie {
  final int id;
  final String originalTitle;
  final String posterPath;
  final String releaseDate;
  final int voteCount;

  Movie({
    required this.originalTitle,
    required this.posterPath,
    required this.voteCount,
    required this.releaseDate,
    required this.id,
  });
}
