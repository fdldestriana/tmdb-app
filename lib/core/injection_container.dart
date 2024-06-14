import 'package:get_it/get_it.dart';
import 'package:tmdb_app/features/discover/data/datasources/get_all_movies_datasource.dart';
import 'package:tmdb_app/features/discover/data/repositories/get_all_movies_repo_impl.dart';
import 'package:tmdb_app/features/discover/domain/repositories/get_all_movies_repo.dart';
import 'package:tmdb_app/features/discover/domain/usecases/get_all_movies_usecase.dart';
import 'package:tmdb_app/features/discover/presentation/bloc/all_movies_bloc.dart';
import 'package:tmdb_app/features/home/data/datasources/get_latest_movies_datasource.dart';
import 'package:tmdb_app/features/home/data/datasources/get_top_rated_movies_datasource.dart';
import 'package:tmdb_app/features/home/data/repositories/get_latest_movies_repo_impl.dart';
import 'package:tmdb_app/features/home/data/repositories/get_top_rated_movies_repo_impl.dart';
import 'package:tmdb_app/features/home/domain/repositories/get_latest_movies_repo.dart';
import 'package:tmdb_app/features/home/domain/repositories/get_top_rated_movies_repo.dart';
import 'package:tmdb_app/features/home/domain/usecases/get_latest_movies_usecase.dart';
import 'package:tmdb_app/features/home/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:tmdb_app/features/home/presentation/bloc/latestmovies/latestmovies_bloc.dart';
import 'package:tmdb_app/features/home/presentation/bloc/topratedmovies/topratedmovies_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // Blocs registration
  sl.registerFactory(() => LatestMoviesBloc(useCase: sl()));
  sl.registerFactory(() => TopRatedMoviesBloc(useCase: sl()));
  sl.registerFactory(() => AllMoviesBloc(useCase: sl()));

  // Usecases registration
  sl.registerLazySingleton(() => GetLatestMoviesUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetAllMoviesUsecase(repository: sl()));

  // Repositories registration
  sl.registerLazySingleton<GetLatestMoviesRepository>(
      () => GetLatestMoviesRepositoryImpl(datasource: sl()));
  sl.registerLazySingleton<GetTopRatedMoviesRepository>(
      () => GetTopRatedMoviesRepositoryImpl(datasource: sl()));
  sl.registerLazySingleton<GetAllMoviesRepository>(
      () => GetAllMoviesRepositoryImpl(datasource: sl()));

  // Datasources registration
  sl.registerLazySingleton<GetLatestMoviesDatasource>(
      () => GetLatestMoviesDatasourceImpl());
  sl.registerLazySingleton<GetTopRatedMoviesDatasource>(
      () => GetTopRatedMoviesDatasourceImpl());

  sl.registerLazySingleton<GetAllMoviesDatasource>(
      () => GetAllMovieDatasourceImpl());
}
