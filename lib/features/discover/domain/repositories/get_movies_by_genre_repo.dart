import 'package:dartz/dartz.dart';
import 'package:tmdb_app/core/entities/movie_entity.dart';
import 'package:tmdb_app/core/error/failures.dart';

abstract class GetMoviesByGenreRepository {
  Future<Either<Failure, List<MovieEntity>>> getMoviesByGenre(int genreId);
}
