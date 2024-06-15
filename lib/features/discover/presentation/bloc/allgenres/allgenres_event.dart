import 'package:equatable/equatable.dart';

abstract class AllGenresEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAllGenresEvent extends AllGenresEvent {}
