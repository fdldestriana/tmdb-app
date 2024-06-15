import 'package:dartz/dartz.dart';
import 'package:tmdb_app/core/entities/genre_entity.dart';
import 'package:tmdb_app/core/error/failures.dart';

abstract class GetAllGenresRepository {
  Future<Either<Failure, List<GenreEntity>>> getAllGenres();
}
