import 'package:dartz/dartz.dart';
import 'package:tmdb_app/core/entities/movie_entity.dart';
import 'package:tmdb_app/core/error/failures.dart';
import 'package:tmdb_app/features/discover/domain/repositories/get_movies_by_genre_repo.dart';

class GetMoviesByGenreUsecase {
  final GetMoviesByGenreRepository repository;
  GetMoviesByGenreUsecase({required this.repository});

  Future<Either<Failure, List<MovieEntity>>> call(Param param) async {
    return await repository.getMoviesByGenre(param.genreId);
  }
}

class Param {
  final int genreId;
  Param({required this.genreId});
}
