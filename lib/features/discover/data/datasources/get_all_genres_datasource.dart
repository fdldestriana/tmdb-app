import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tmdb_app/core/constants/app_constants.dart';
import 'package:tmdb_app/core/data/models/genre_model.dart';

abstract class GetAllGenresDatasource {
  Future<List<GenreModel>> getAllGenres();
}

class GetAllGenresDatasourceImpl implements GetAllGenresDatasource {
  final Dio dio = Dio();
  List<GenreModel> allGenres = [];
  @override
  Future<List<GenreModel>> getAllGenres() async {
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
      final Response response = await dio.get(AppConstants.allMovieGenresUrl);
      if (response.statusCode == 200) {
        List<dynamic> movies = response.data["genres"] as List<dynamic>;
        for (Map<String, dynamic> movie in movies) {
          allGenres.add(GenreModel.fromJson(movie));
        }
      }
      return allGenres;
    } on Exception catch (e) {
      log("ERROR GET ALL GENRES ${e.toString()}");
      rethrow;
    }
  }
}
