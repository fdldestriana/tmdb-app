import 'package:equatable/equatable.dart';
import 'package:tmdb_app/features/home/domain/entities/movie_latest_entity.dart';

abstract class LatestMoviesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetLatestMoviesInitial extends LatestMoviesState {}

class GetLatestMoviesLoading extends LatestMoviesState {}

class GetLatestMoviesLoaded extends LatestMoviesState {
  final List<MovieLatestEntity> latestMovies;
  GetLatestMoviesLoaded({required this.latestMovies});
}

class GetLatestMoviesError extends LatestMoviesState {
  final String errorMessage;
  GetLatestMoviesError({required this.errorMessage});
}
