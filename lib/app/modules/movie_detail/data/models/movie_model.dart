import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required String originalTitle,
    required String posterPath,
    required int voteCount,
    required int id,
  }) : super(
          originalTitle: originalTitle,
          posterPath: posterPath,
          voteCount: voteCount,
          id: id,
        );

  factory MovieModel.fromJson(Map<String, dynamic> map) {
    return MovieModel(
      originalTitle: map['original_title'] as String,
      posterPath: map['poster_path'] as String,
      voteCount: map['vote_count'] as int,
      id: map['id'] as int,
    );
  }
}
