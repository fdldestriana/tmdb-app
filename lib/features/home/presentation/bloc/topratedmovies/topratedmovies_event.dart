import 'package:equatable/equatable.dart';

abstract class TopRatedMoviesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetTopRatedMoviesEvent extends TopRatedMoviesEvent {}
