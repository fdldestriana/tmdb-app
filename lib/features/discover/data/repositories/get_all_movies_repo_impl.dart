import 'package:dartz/dartz.dart';
import 'package:tmdb_app/core/entities/movie_entity.dart';
import 'package:tmdb_app/core/error/failures.dart';
import 'package:tmdb_app/features/discover/data/datasources/get_all_movies_datasource.dart';
import 'package:tmdb_app/features/discover/domain/repositories/get_all_movies_repo.dart';

class GetAllMoviesRepositoryImpl implements GetAllMoviesRepository {
  final GetAllMoviesDatasource datasource;
  GetAllMoviesRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<MovieEntity>>> getAllMovies() async {
    try {
      final allMovies = await datasource.getAllMovies();
      return Right(allMovies);
    } on Exception catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
