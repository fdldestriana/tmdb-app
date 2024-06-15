import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:tmdb_app/core/entities/movie_entity.dart';
import 'package:tmdb_app/core/error/failures.dart';
import 'package:tmdb_app/features/discover/domain/usecases/get_all_movies_usecase.dart';
import 'package:tmdb_app/features/discover/presentation/bloc/allmovies/all_movies_event.dart';
import 'package:tmdb_app/features/discover/presentation/bloc/allmovies/all_movies_state.dart';

class AllMoviesBloc extends Bloc<AllMoviesEvent, AllMoviesState> {
  GetAllMoviesUsecase useCase;
  AllMoviesBloc({required this.useCase}) : super(GetAllMoviesInitial()) {
    on<AllMoviesEvent>(
      (event, emit) async {
        emit(GetAllMoviesLoading());
        Either<Failure, List<MovieEntity>> allMovies = await useCase.call();
        allMovies.fold(
            (l) => emit(GetAllMoviesError(errorMessage: l.toString())),
            (r) => emit(GetAllMoviesLoaded(allMovies: r)));
      },
    );
  }
}
