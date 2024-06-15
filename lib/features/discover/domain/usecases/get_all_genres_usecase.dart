import 'package:dartz/dartz.dart';
import 'package:tmdb_app/core/entities/genre_entity.dart';
import 'package:tmdb_app/core/error/failures.dart';
import 'package:tmdb_app/features/discover/domain/repositories/get_all_genres_repo.dart';

class GetAllGenresUsecase {
  final GetAllGenresRepository repository;
  GetAllGenresUsecase({required this.repository});

  Future<Either<Failure, List<GenreEntity>>> call() async {
    return await repository.getAllGenres();
  }
}
