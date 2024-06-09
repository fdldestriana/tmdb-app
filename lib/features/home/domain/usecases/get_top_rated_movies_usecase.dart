import 'package:dartz/dartz.dart';
import 'package:tmdb_app/core/error/failures.dart';
import 'package:tmdb_app/features/home/domain/entities/movie_top_rated_entity.dart';
import 'package:tmdb_app/features/home/domain/repositories/get_top_rated_movies_repo.dart';

class GetTopRatedMoviesUseCase {
  final GetTopRatedMoviesRepository repository;
  GetTopRatedMoviesUseCase({required this.repository});

  Future<Either<Failure, List<MovieTopRatedEntity>>> call() async {
    return await repository.getTopRatedMovies();
  }
}
