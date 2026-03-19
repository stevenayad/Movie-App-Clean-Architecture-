import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enms.dart';
import 'package:movie_app/movie/domain/entites/movie.dart';
import 'package:movie_app/movie/domain/usecases/get_now_playning_movie_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_popular_movie_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_top_realted_movie_usecase.dart';
part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayningMovieUsecase getNowPlayningMovieUsecase;
  final GetPopularMovieUsecase getPopularMovieUsecase;
  final GetTopRealtedMovieUsecase getTopRealtedMovieUsecase;
  MovieBloc({
    required this.getNowPlayningMovieUsecase,
    required this.getPopularMovieUsecase,
    required this.getTopRealtedMovieUsecase,
  }) : super(const MovieState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayningMovieUsecase.execute();
      result.fold(
        (l) => emit(
          state.copyWith(
            nowplayingrequestState: RequestState.error,
            nowplayingmessage: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(
            nowplayingrequestState: RequestState.loaded,
            nowplayingMovies: r,
          ),
        ),
      );
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMovieUsecase.execute();
      result.fold(
        (l) => emit(
          state.copyWith(
            popularrequestState: RequestState.error,
            popularplayingmessage: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(
            popularMovies: r,
            popularrequestState: RequestState.loaded,
          ),
        ),
      );
    });
    on<GetTopRealtedMoviesEvent>((event, emit) async {
      final result = await getTopRealtedMovieUsecase.execute();
      result.fold(
        (l) => emit(
          state.copyWith(
            topratedrequestState: RequestState.error,
            topratedplayingmessage: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(
            topratedMovies: r,
            topratedrequestState: RequestState.loaded,
          ),
        ),
      );
    });
  }
}
