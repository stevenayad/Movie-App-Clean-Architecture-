import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/execptions.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/movie/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/movie/domain/entites/movie.dart';
import 'package:movie_app/movie/domain/repository/base_movie_repository.dart';

class MovieRepository implements BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository({required this.baseMovieRemoteDataSource});
  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerExecption catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovie() async {
    final result = await baseMovieRemoteDataSource.getPopularMovie();
    try {
      return Right(result);
    } on ServerExecption catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRelatedMovie() async {
    final result = await baseMovieRemoteDataSource.getTopRealtedMovie();
    try {
      return Right(result);
    } on ServerExecption catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }
}
