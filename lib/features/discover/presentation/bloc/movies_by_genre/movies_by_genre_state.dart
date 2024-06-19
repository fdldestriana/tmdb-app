import 'package:equatable/equatable.dart';
import 'package:tmdb_app/core/entities/movie_entity.dart';

abstract class MoviesByGenreState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetMoviesByGenreInitial extends MoviesByGenreState {}

class GetMoviesByGenreLoading extends MoviesByGenreState {}

class GetMoviesByGenreLoaded extends MoviesByGenreState {
  final List<MovieEntity> moviesEntity;
  GetMoviesByGenreLoaded({required this.moviesEntity});
}

class GetMoviesByGenreError extends MoviesByGenreState {
  final String errorMessage;
  GetMoviesByGenreError({required this.errorMessage});
}
