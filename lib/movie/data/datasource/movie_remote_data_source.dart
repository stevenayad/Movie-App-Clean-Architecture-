import 'package:dio/dio.dart';
import 'package:movie_app/core/contast.dart';
import 'package:movie_app/core/error/execptions.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/movie/data/models/moviemodel.dart';
import 'package:movie_app/movie/domain/repository/base_movie_repository.dart';

abstract class BaseMovieRemoteDataSource {
 Future<List<Moviemodel>> getNowPlayingMovies();
 Future<List<Moviemodel>> getPopularMovie();
  Future<List<Moviemodel>> getTopRealtedMovie();
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  @override
  Future<List<Moviemodel>> getNowPlayingMovies() async {
    final respone = await Dio().get('${Constant.nowplayingmovie}');
    if (respone.statusCode == 200) {
      return (respone.data['results'] as List)
          .map((e) => Moviemodel.fromJson(e))
          .toList();
    } else {
      throw ServerExecption(
        errorMessageModel: ErrorMessageModel.fromJson(respone.data),
      );
    }
  }

  @override
 Future<List<Moviemodel>> getPopularMovie() async {
    final respone = await Dio().get('${Constant.popularmovie}');
    if (respone.statusCode == 200) {
      return (respone.data['results'] as List)
          .map((e) => Moviemodel.fromJson(e))
          .toList();
    } else {
      throw ServerExecption(
        errorMessageModel: ErrorMessageModel.fromJson(respone.data),
      );
    }
  }

  @override
 Future<List<Moviemodel>> getTopRealtedMovie() async{
      final respone = await Dio().get('${Constant.toprealted}');
    if (respone.statusCode == 200) {
      return (respone.data['results'] as List)
          .map((e) => Moviemodel.fromJson(e))
          .toList();
    } else {
      throw ServerExecption(
        errorMessageModel: ErrorMessageModel.fromJson(respone.data),
      );
    }
  }
}
