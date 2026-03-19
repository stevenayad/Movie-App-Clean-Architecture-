import 'package:get_it/get_it.dart';
import 'package:movie_app/movie/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/movie/data/repository/movie_repository.dart';
import 'package:movie_app/movie/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movie/domain/usecases/get_now_playning_movie_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_popular_movie_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_top_realted_movie_usecase.dart';
import 'package:movie_app/movie/presentation/controller/movie/movie_bloc.dart';

final sl = GetIt.instance;

//registerLazySingleton => Create one object for all Application and use object when needed
//registerSingleton=>Create one object for all Application and use object when Created Object
//registerFactory => Create more object when call class

class Serversloctor {
  void init() {
    //Movie Bloc
    sl.registerFactory(
      () => MovieBloc(
        getNowPlayningMovieUsecase: sl(),
        getPopularMovieUsecase: sl(),
        getTopRealtedMovieUsecase: sl(),
      ),
    );
    //usecase
    sl.registerLazySingleton(
      () => GetNowPlayningMovieUsecase(baseMovieRepository: sl()),
    );
    sl.registerLazySingleton(
      () => GetPopularMovieUsecase(baseMovieRepository: sl()),
    );
    sl.registerLazySingleton(
      () => GetTopRealtedMovieUsecase(baseMovieRepository: sl()),
    );


    //Repository
    sl.registerLazySingleton<BaseMovieRepository>(
      () => MovieRepository(baseMovieRemoteDataSource: sl()),
    );
    //DataSource
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource(),
    );
  }
}
