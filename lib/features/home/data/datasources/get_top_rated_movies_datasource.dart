import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tmdb_app/core/constants/app_constants.dart';
import 'package:tmdb_app/features/home/data/models/movie_top_rated_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class GetTopRatedMoviesDatasource {
  Future<List<MovieTopRatedModel>> getTopRatedMovies();
}

class GetTopRatedMoviesDatasourceImpl implements GetTopRatedMoviesDatasource {
  final Dio dio = Dio();
  List<MovieTopRatedModel> topRatedMovies = [];

  @override
  Future<List<MovieTopRatedModel>> getTopRatedMovies() async {
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
      final Response response = await dio.get(AppConstants.topRatedMoviesUrl);
      if (response.statusCode == 200) {
        List<dynamic> movies = response.data["results"] as List<dynamic>;
        for (Map<String, dynamic> movie in movies) {
          topRatedMovies.add(MovieTopRatedModel.fromJson(movie));
        }
      }
      return topRatedMovies;
    } on Exception catch (e) {
      log("ERROR GET TOP RATED ${e.toString()}");
      rethrow;
    }
  }
}
