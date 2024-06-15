import 'package:tmdb_app/core/entities/genre_entity.dart';

class GenreModel extends GenreEntity {
  GenreModel({required super.id, required super.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json["id"],
      name: json["name"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
    };
  }
}