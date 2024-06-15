import 'package:dartz/dartz.dart';
import 'package:tmdb_app/core/entities/genre_entity.dart';
import 'package:tmdb_app/core/error/failures.dart';
import 'package:tmdb_app/features/discover/data/datasources/get_all_genres_datasource.dart';
import 'package:tmdb_app/features/discover/domain/repositories/get_all_genres_repo.dart';

class GetAllGenresRepositoryImpl implements GetAllGenresRepository {
  final GetAllGenresDatasource datasource;
  GetAllGenresRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<GenreEntity>>> getAllGenres() async {
    try {
      final allGenres = await datasource.getAllGenres();
      return Right(allGenres);
    } on Exception catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
