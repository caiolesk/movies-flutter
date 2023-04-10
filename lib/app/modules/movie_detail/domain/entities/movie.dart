class Movie {
  final int id;
  final String originalTitle;
  final String posterPath;
  final int voteCount;

  Movie({
    required this.originalTitle,
    required this.posterPath,
    required this.voteCount,
    required this.id,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      originalTitle: map['original_title'] as String,
      posterPath: map['poster_path'] as String,
      voteCount: map['vote_count'] as int,
    );
  }
}
