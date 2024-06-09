import 'package:equatable/equatable.dart';
import 'package:tmdb_app/features/home/domain/entities/movie_top_rated_entity.dart';

abstract class TopRatedMoviesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetTopRatedMoviesInitial extends TopRatedMoviesState {}

class GetTopRatedMoviesLoading extends TopRatedMoviesState {}

class GetTopRatedMoviesLoaded extends TopRatedMoviesState {
  final List<MovieTopRatedEntity> topRatedMovies;
  GetTopRatedMoviesLoaded({required this.topRatedMovies});
}

class GetTopRatedMoviesError extends TopRatedMoviesState {
  final String errorMessage;
  GetTopRatedMoviesError({required this.errorMessage});
}