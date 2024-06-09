import 'package:dartz/dartz.dart';
import 'package:tmdb_app/core/error/failures.dart';
import 'package:tmdb_app/features/home/domain/entities/movie_latest_entity.dart';

abstract class GetLatestMoviesRepository {
  Future<Either<Failure, List<MovieLatestEntity>>> getLatestMovies();
}
