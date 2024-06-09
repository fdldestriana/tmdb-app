import 'package:dartz/dartz.dart';
import 'package:tmdb_app/core/error/failures.dart';
import 'package:tmdb_app/features/home/domain/entities/movie_latest_entity.dart';
import 'package:tmdb_app/features/home/domain/repositories/get_latest_movies_repo.dart';

class GetLatestMoviesUseCase {
  final GetLatestMoviesRepository repository;
  GetLatestMoviesUseCase({required this.repository});

  Future<Either<Failure, List<MovieLatestEntity>>> call() async {
    return await repository.getLatestMovies();
  }
}
