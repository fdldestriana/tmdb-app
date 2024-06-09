// class MovieEntity {
//   bool adult;
//   dynamic backdropPath;
//   dynamic belongsToCollection;
//   int? budget;
//   List<dynamic> genres;
//   String homepage;
//   int id;
//   dynamic imdbId;
//   List<String> originCountry;
//   String originalLanguage;
//   String originalTitle;
//   String overview;
//   int popularity;
//   dynamic posterPath;
//   List<dynamic> productionCompanies;
//   List<dynamic> productionCountries;
//   String releaseDate;
//   int revenue;
//   int runtime;
//   List<dynamic> spokenLanguages;
//   String status;
//   String tagline;
//   String title;
//   bool video;
//   int voteAverage;
//   int voteCount;

//   MovieEntity({
//     required this.adult,
//     required this.backdropPath,
//     required this.belongsToCollection,
//     required this.budget,
//     required this.genres,
//     required this.homepage,
//     required this.id,
//     required this.imdbId,
//     required this.originCountry,
//     required this.originalLanguage,
//     required this.originalTitle,
//     required this.overview,
//     required this.popularity,
//     required this.posterPath,
//     required this.productionCompanies,
//     required this.productionCountries,
//     required this.releaseDate,
//     required this.revenue,
//     required this.runtime,
//     required this.spokenLanguages,
//     required this.status,
//     required this.tagline,
//     required this.title,
//     required this.video,
//     required this.voteAverage,
//     required this.voteCount,
//   });
// }
class MovieTopRatedEntity {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieTopRatedEntity({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
}
