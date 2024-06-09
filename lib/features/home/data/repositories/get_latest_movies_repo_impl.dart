import 'package:dartz/dartz.dart';
import 'package:tmdb_app/core/error/failures.dart';
import 'package:tmdb_app/features/home/data/datasources/get_latest_movies_datasource.dart';
import 'package:tmdb_app/features/home/domain/entities/movie_latest_entity.dart';
import 'package:tmdb_app/features/home/domain/repositories/get_latest_movies_repo.dart';

class GetLatestMoviesRepositoryImpl implements GetLatestMoviesRepository {
  final GetLatestMoviesDatasource datasource;
  GetLatestMoviesRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<MovieLatestEntity>>> getLatestMovies() async {
    try {
      final latestMovies = await datasource.getLatestMovies();
      return Right(latestMovies);
    } on Exception catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
