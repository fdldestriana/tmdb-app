import 'package:equatable/equatable.dart';

abstract class AllMoviesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAllMoviesEvent extends AllMoviesEvent {}
