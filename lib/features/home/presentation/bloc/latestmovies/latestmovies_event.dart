import 'package:equatable/equatable.dart';

abstract class LatestMoviesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetLatestMoviesEvent extends LatestMoviesEvent {}
