import 'package:equatable/equatable.dart';
import 'package:tmdb_app/core/entities/movie_entity.dart';

abstract class AllMoviesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAllMoviesInitial extends AllMoviesState {}

class GetAllMoviesLoading extends AllMoviesState {}

class GetAllMoviesLoaded extends AllMoviesState {
  final List<MovieEntity> allMovies;
  GetAllMoviesLoaded({required this.allMovies});
}

class GetAllMoviesError extends AllMoviesState {
  final String errorMessage;
  GetAllMoviesError({required this.errorMessage});
}
