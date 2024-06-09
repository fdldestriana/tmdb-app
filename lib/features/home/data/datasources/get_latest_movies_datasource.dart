import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:tmdb_app/core/constants/app_constants.dart';
import 'package:tmdb_app/features/home/data/models/movie_latest_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class GetLatestMoviesDatasource {
  Future<List<MovieLatestModel>> getLatestMovies();
}

class GetLatestMoviesDatasourceImpl implements GetLatestMoviesDatasource {
  final Dio dio = Dio();
  List<MovieLatestModel> latestMovies = [];

  @override
  Future<List<MovieLatestModel>> getLatestMovies() async {
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
      final Response response = await dio.get(AppConstants.latestMoviesUrl);
      if (response.statusCode == 200) {
        Map<String, dynamic> movie = response.data as Map<String, dynamic>;
        latestMovies.add(MovieLatestModel.fromJson(movie));
      }
      return latestMovies;
    } on Exception catch (e) {
      log("ERROR GET LATEST ${e.toString()}");
      rethrow;
    }
  }
}
