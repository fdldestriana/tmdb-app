import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tmdb_app/core/constants/app_constants.dart';
import 'package:tmdb_app/core/data/models/movie_model.dart';

abstract class GetMoviesByGenreDatasource {
  Future<List<MovieModel>> getMoviesByGenre(int genreId);
}

class GetMoviesByGenreDatasourceImpl implements GetMoviesByGenreDatasource {
  final Dio dio = Dio();

  List<MovieModel> moviesByGenre = [];
  @override
  Future<List<MovieModel>> getMoviesByGenre(int genreId) async {
    // adding API KEY within the request
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers["Authorization"] = "Bearer ${dotenv.env['API_KEY']}";
          return handler.next(options);
        },
      ),
    );

    try {
      final Response response =
          await dio.get(AppConstants.getSimilarMovieBasedOnGenreUrl(genreId));

      if (response.statusCode == 200) {
        List<dynamic> movies = response.data["results"] as List<dynamic>;
        for (Map<String, dynamic> movie in movies) {
          moviesByGenre.add(MovieModel.fromJson(movie));
        }
      }
      log("THE RESULT $moviesByGenre");
      return moviesByGenre;
    } on Exception catch (e) {
      log("ERROR GET ALL MOVIES BY GENRE ${e.toString()}");
      rethrow;
    }
  }
}
