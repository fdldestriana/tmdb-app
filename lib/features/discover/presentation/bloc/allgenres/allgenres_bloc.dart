import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:tmdb_app/core/entities/genre_entity.dart';
import 'package:tmdb_app/core/error/failures.dart';
import 'package:tmdb_app/features/discover/domain/usecases/get_all_genres_usecase.dart';
import 'package:tmdb_app/features/discover/presentation/bloc/allgenres/allgenres_event.dart';
import 'package:tmdb_app/features/discover/presentation/bloc/allgenres/allgenres_state.dart';

class AllGenresBloc extends Bloc<AllGenresEvent, AllGenresState> {
  final GetAllGenresUsecase useCase;
  AllGenresBloc({required this.useCase}) : super(GetAllGenresInitial()) {
    on<AllGenresEvent>(
      (event, emit) async {
        emit(GetAllGenresLoading());
        Either<Failure, List<GenreEntity>> allGenres = await useCase.call();
        allGenres.fold(
            (l) => emit(GetAllGenresError(errorMessage: l.toString())),
            (r) => emit(GetAllGenresLoaded(allGenres: r)));
      },
    );
  }
}
