import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tmdb_app/core/constants/app_constants.dart';
import 'package:tmdb_app/core/data/models/movie_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class GetTopRatedMoviesDatasource {
  Future<List<MovieModel>> getTopRatedMovies();
}

class GetTopRatedMoviesDatasourceImpl implements GetTopRatedMoviesDatasource {
  final Dio dio = Dio();
  List<MovieModel> topRatedMovies = [];

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
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
          topRatedMovies.add(MovieModel.fromJson(movie));
        }
      }
      return topRatedMovies;
    } on Exception catch (e) {
      log("ERROR GET TOP RATED ${e.toString()}");
      rethrow;
    }
  }
}
