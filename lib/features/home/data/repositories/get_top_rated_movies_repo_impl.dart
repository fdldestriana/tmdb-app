import 'package:dartz/dartz.dart';
import 'package:tmdb_app/core/error/failures.dart';
import 'package:tmdb_app/features/home/data/datasources/get_top_rated_movies_datasource.dart';
import 'package:tmdb_app/core/entities/movie_entity.dart';
import 'package:tmdb_app/features/home/domain/repositories/get_top_rated_movies_repo.dart';

class GetTopRatedMoviesRepositoryImpl implements GetTopRatedMoviesRepository {
  final GetTopRatedMoviesDatasource datasource;
  GetTopRatedMoviesRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies() async {
    try {
      final topRatedMovies = await datasource.getTopRatedMovies();
      return Right(topRatedMovies);
    } on Exception catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
