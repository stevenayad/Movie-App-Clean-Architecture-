part of 'movie_bloc.dart';

class MovieState extends Equatable {
  const MovieState({
    this.nowplayingMovies = const [],
    this.nowplayingState = RequestState.loading,
    this.nowplayingmessage = '',
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularplayingmessage = '',
    this.topratedMovies = const [],
    this.topratedState = RequestState.loading,
    this.topratedplayingmessage = '',
  });
  final List<Movie> nowplayingMovies;
  final RequestState nowplayingState;
  final String nowplayingmessage;
  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularplayingmessage;
  final List<Movie> topratedMovies;
  final RequestState topratedState;
  final String topratedplayingmessage;

  MovieState copyWith({
    List<Movie>? nowplayingMovies,
    RequestState? nowplayingrequestState,
    String? nowplayingmessage,
    List<Movie>? popularMovies,
    RequestState? popularrequestState,
    String? popularplayingmessage,
    List<Movie>? topratedMovies,
    RequestState? topratedrequestState,
    String? topratedplayingmessage,
  }) {
    return MovieState(
      nowplayingMovies: nowplayingMovies ?? this.nowplayingMovies,
      nowplayingState: nowplayingrequestState ?? this.nowplayingState,
      nowplayingmessage: nowplayingmessage ?? this.nowplayingmessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularrequestState ?? this.popularState,
      popularplayingmessage:
          popularplayingmessage ?? this.popularplayingmessage,
      topratedMovies: topratedMovies ?? this.topratedMovies,
      topratedState: topratedrequestState ?? this.topratedState,
      topratedplayingmessage:
          topratedplayingmessage ?? this.topratedplayingmessage,
    );
  }

  @override
  List<Object> get props => [
    nowplayingMovies,
    nowplayingState,
    nowplayingmessage,
    popularMovies,
    popularState,
    popularplayingmessage,
    topratedMovies,
    topratedState,
    topratedplayingmessage,
  ];
}
