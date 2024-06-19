import 'package:equatable/equatable.dart';

abstract class MoviesByGenreEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetMoviesByGenreEvent extends MoviesByGenreEvent {
  final int genreId;

  GetMoviesByGenreEvent({required this.genreId});
}
