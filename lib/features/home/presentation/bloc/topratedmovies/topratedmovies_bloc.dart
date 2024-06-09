import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:tmdb_app/core/error/failures.dart';
import 'package:tmdb_app/features/home/domain/entities/movie_top_rated_entity.dart';
import 'package:tmdb_app/features/home/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:tmdb_app/features/home/presentation/bloc/topratedmovies/topratedmovies_event.dart';
import 'package:tmdb_app/features/home/presentation/bloc/topratedmovies/topratedmovies_state.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final GetTopRatedMoviesUseCase useCase;
  TopRatedMoviesBloc({required this.useCase})
      : super(GetTopRatedMoviesInitial()) {
    on<GetTopRatedMoviesEvent>(
      (event, emit) async {
        emit(GetTopRatedMoviesLoading());
        Either<Failure, List<MovieTopRatedEntity>> topRatedMovies =
            await useCase.call();
        topRatedMovies.fold(
            (l) => emit(GetTopRatedMoviesError(errorMessage: l.toString())),
            (r) => emit(GetTopRatedMoviesLoaded(topRatedMovies: r)));
      },
    );
  }
}
