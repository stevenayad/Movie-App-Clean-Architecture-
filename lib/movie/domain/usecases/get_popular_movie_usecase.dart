import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movie/domain/entites/movie.dart';
import 'package:movie_app/movie/domain/repository/base_movie_repository.dart';

class GetPopularMovieUsecase {
    final BaseMovieRepository baseMovieRepository;

  GetPopularMovieUsecase({required this.baseMovieRepository});

  Future<Either<Failure, List<Movie>>> execute() async{
    return await baseMovieRepository.getPopularMovie();
  }
}