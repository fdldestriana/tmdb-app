import 'package:dartz/dartz.dart';
import 'package:tmdb_app/core/entities/movie_entity.dart';
import 'package:tmdb_app/core/error/failures.dart';
import 'package:tmdb_app/features/discover/data/datasources/get_movies_by_genre_datasource.dart';
import 'package:tmdb_app/features/discover/domain/repositories/get_movies_by_genre_repo.dart';

class GetMoviesByGenreRepositoryImpl implements GetMoviesByGenreRepository {
  GetMoviesByGenreDatasource datasource;
  GetMoviesByGenreRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, List<MovieEntity>>> getMoviesByGenre(
      int genreId) async {
    try {
      final moviesByGenre = await datasource.getMoviesByGenre(genreId);
      return Right(moviesByGenre);
    } on Exception catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
