class MovieLatestEntity {
  bool adult;
  dynamic backdropPath;
  dynamic belongsToCollection;
  int budget;
  List<dynamic> genres;
  String homepage;
  int id;
  String? imdbId;
  List<String> originCountry;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  dynamic posterPath;
  List<dynamic> productionCompanies;
  List<dynamic> productionCountries;
  String releaseDate;
  int revenue;
  int runtime;
  List<dynamic> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MovieLatestEntity({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
}

class SpokenLanguage {
  String englishName;
  String iso6391;
  String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });
}
