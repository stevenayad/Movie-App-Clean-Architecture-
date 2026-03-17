import 'package:movie_app/movie/domain/entites/movie.dart';

class Moviemodel extends Movie {
  Moviemodel({
    required super.id,
    required super.backdropPath,
    required super.title,
    required super.genre_ids,
    required super.overview,
    required super.voteaverage,
    required super.release_date,
  });

  factory Moviemodel.fromJson(Map<String, dynamic> json) {
    return Moviemodel(
      id: json['id'],
      backdropPath: json['backdrop_path'] ?? '',
      title: json['title'] ?? '',
      genre_ids: List<int>.from(json['genre_ids'] ?? []),
      overview: json['overview'] ?? '',
      voteaverage: (json['vote_average'] ?? 0).toDouble(),
      release_date: json['release_date'] ?? '',
    );
  }
}
