import 'package:equatable/equatable.dart';
import 'package:tmdb_app/core/entities/genre_entity.dart';

abstract class AllGenresState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAllGenresInitial extends AllGenresState {}

class GetAllGenresLoading extends AllGenresState {}

class GetAllGenresLoaded extends AllGenresState {
  final List<GenreEntity> allGenres;
  GetAllGenresLoaded({required this.allGenres});
}

class GetAllGenresError extends AllGenresState {
  final String errorMessage;
  GetAllGenresError({required this.errorMessage});
}
