import 'package:tmdb_app/features/home/domain/entities/movie_top_rated_entity.dart';

class MovieTopRatedModel extends MovieTopRatedEntity {
  MovieTopRatedModel(
      {required super.adult,
      required super.backdropPath,
      required super.id,
      required super.originalLanguage,
      required super.originalTitle,
      required super.overview,
      required super.popularity,
      required super.posterPath,
      required super.releaseDate,
      required super.title,
      required super.video,
      required super.voteAverage,
      required super.voteCount,
      required super.genreIds});

  factory MovieTopRatedModel.fromJson(Map<String, dynamic> json) {
    return MovieTopRatedModel(
      adult: json["adult"],
      backdropPath: json["backdrop_path"],
      id: json["id"],
      originalLanguage: json["originalLanguage"],
      originalTitle: json["originalTitle"],
      overview: json["overview"],
      popularity: json["popularity"],
      posterPath: json["posterPath"],
      releaseDate: json["releaseDate"],
      title: json["title"],
      video: json["video"],
      voteAverage: json["vote_average"],
      voteCount: json["voteCount"],
      genreIds: json["genreIds"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "adult": adult,
      "backdrop_path": backdropPath,
      "id": id,
      "originalLanguage": originalLanguage,
      "originalTitle": originalTitle,
      "overview": overview,
      "popularity": popularity,
      "posterPath": posterPath,
      "releaseDate": releaseDate,
      "title": title,
      "video": video,
      "vote_average": voteAverage,
      "voteCount": voteCount,
    };
  }
}
