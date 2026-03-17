import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String backdropPath;
  final String title;
  final List<int> genre_ids;
  final String overview;
  final double voteaverage;
  final double release_date;

  const Movie({
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.genre_ids,
    required this.overview,
    required this.voteaverage,
    required this.release_date,
  });

  @override
  List<Object?> get props => [
    id,
    backdropPath,
    title,
    genre_ids,
    overview,
    voteaverage,
    release_date
  ];
}
