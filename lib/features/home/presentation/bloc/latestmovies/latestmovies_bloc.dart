import 'package:dartz/dartz.dart';
import 'package:tmdb_app/core/error/failures.dart';
import 'package:tmdb_app/features/home/domain/entities/movie_latest_entity.dart';
import 'package:tmdb_app/features/home/domain/usecases/get_latest_movies_usecase.dart';
import 'package:tmdb_app/features/home/presentation/bloc/latestmovies/latestmovies_event.dart';
import 'package:tmdb_app/features/home/presentation/bloc/latestmovies/latestmovies_state.dart';
import 'package:bloc/bloc.dart';

class LatestMoviesBloc extends Bloc<LatestMoviesEvent, LatestMoviesState> {
  final GetLatestMoviesUseCase useCase;
  LatestMoviesBloc({required this.useCase}) : super(GetLatestMoviesInitial()) {
    on<GetLatestMoviesEvent>(
      (event, emit) async {
        emit(GetLatestMoviesLoading());
        Either<Failure, List<MovieLatestEntity>> latestMovies =
            await useCase.call();
        latestMovies.fold(
            (l) => emit(GetLatestMoviesError(errorMessage: l.toString())),
            (r) => emit(GetLatestMoviesLoaded(latestMovies: r)));
      },
    );
  }
}
