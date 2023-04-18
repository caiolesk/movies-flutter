import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required String originalTitle,
    required String posterPath,
    required int voteCount,
    required String releaseDate,
    required int id,
  }) : super(
          originalTitle: originalTitle,
          posterPath: posterPath,
          voteCount: voteCount,
          releaseDate: releaseDate,
          id: id,
        );

  factory MovieModel.fromJson(Map<String, dynamic> map) {
    return MovieModel(
      originalTitle: map['original_title'] as String,
      posterPath: map['backdrop_path'] ?? map['poster_path'] ?? '',
      voteCount: map['vote_count'] as int,
      releaseDate: map['release_date'] as String,
      id: map['id'] as int,
    );
  }
}
