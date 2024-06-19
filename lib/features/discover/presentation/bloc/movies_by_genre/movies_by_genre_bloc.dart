import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_app/core/entities/movie_entity.dart';
import 'package:tmdb_app/core/error/failures.dart';
import 'package:tmdb_app/features/discover/domain/usecases/get_movies_by_genre_usecase.dart';
import 'package:tmdb_app/features/discover/presentation/bloc/movies_by_genre/movies_by_genre_event.dart';
import 'package:tmdb_app/features/discover/presentation/bloc/movies_by_genre/movies_by_genre_state.dart';
import 'package:tmdb_app/features/discover/domain/usecases/get_movies_by_genre_usecase.dart'
    as use_case;

class MoviesByGenreBloc extends Bloc<MoviesByGenreEvent, MoviesByGenreState> {
  GetMoviesByGenreUsecase useCase;
  MoviesByGenreBloc({required this.useCase})
      : super(GetMoviesByGenreInitial()) {
    on<GetMoviesByGenreEvent>(
      (event, emit) async {
        emit(GetMoviesByGenreLoading());
        Either<Failure, List<MovieEntity>> moviesEntity =
            await useCase.call(use_case.Param(genreId: event.genreId));
        moviesEntity.fold(
            (l) => emit(GetMoviesByGenreError(errorMessage: l.toString())),
            (r) => emit(GetMoviesByGenreLoaded(moviesEntity: r)));
      },
    );
  }
}
