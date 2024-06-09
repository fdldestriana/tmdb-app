import 'package:dartz/dartz.dart';
import 'package:tmdb_app/core/error/failures.dart';
import 'package:tmdb_app/features/home/domain/entities/movie_top_rated_entity.dart';

abstract class GetTopRatedMoviesRepository {
  Future<Either<Failure, List<MovieTopRatedEntity>>> getTopRatedMovies();
}
