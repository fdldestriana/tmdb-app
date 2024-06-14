import 'package:dartz/dartz.dart';
import 'package:tmdb_app/core/entities/movie_entity.dart';
import 'package:tmdb_app/core/error/failures.dart';
import 'package:tmdb_app/features/discover/domain/repositories/get_all_movies_repo.dart';

class GetAllMoviesUsecase {
  final GetAllMoviesRepository repository;
  GetAllMoviesUsecase({required this.repository});

  Future<Either<Failure, List<MovieEntity>>> call() async {
    return await repository.getAllMovies();
  }
}
