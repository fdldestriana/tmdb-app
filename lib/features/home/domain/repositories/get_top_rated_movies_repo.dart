import 'package:dartz/dartz.dart';
import 'package:tmdb_app/core/error/failures.dart';
import 'package:tmdb_app/core/entities/movie_entity.dart';

abstract class GetTopRatedMoviesRepository {
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();
}
