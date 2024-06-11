import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmdb_app/core/constants/app_constants.dart';
import 'package:tmdb_app/features/home/presentation/bloc/latestmovies/latestmovies_state.dart';
import 'package:tmdb_app/features/home/presentation/widgets/bookmark_button.dart';

class LatestMovie extends StatelessWidget {
  const LatestMovie({super.key, required this.state});

  final GetLatestMoviesLoaded state;

  @override
  Widget build(BuildContext context) {
    List<Widget> genres = [];
    if (state.latestMovies.first.genres.isEmpty) {
      genres.add(Container());
    } else {
      for (int i = 0; i < state.latestMovies.first.genres.length; i++) {
        genres.add(Text(state.latestMovies.first.genres[i]["name"]));
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: AppConstants.latest,
                  style:
                      TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '.',
                  style: TextStyle(
                      color: const Color(0xFFFFC700),
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 0.02.sh,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (state.latestMovies.first.backdropPath == null)
                  ? Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.04.sw),
                          color: Colors.teal,
                        ),
                        height: 0.34.sh,
                        width: 0.49.sw,
                      ),
                      Positioned(
                        right: 0.04.sw,
                        top: 0.02.sh,
                        child: const BookmarkButton(),
                      )
                    ])
                  : Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0.04.sw),
                          child: Image.network(
                              fit: BoxFit.fitHeight,
                              height: 0.34.sh,
                              width: 0.49.sw,
                              "${AppConstants.imageBaseUrl}${state.latestMovies.first.backdropPath}"),
                        ),
                        Positioned(
                          right: 0.04.sw,
                          top: 0.02.sh,
                          child: const BookmarkButton(),
                        )
                      ],
                    ),
              SizedBox(width: 0.05.sw),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.visible,
                      state.latestMovies.first.title,
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 0.01.sh,
                    ),
                    Row(
                      children: [
                        Text(
                          "${state.latestMovies.first.voteAverage}",
                          style: TextStyle(fontSize: 22.sp),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 0.01.sh,
                    ),
                    ...genres,
                    SizedBox(
                      height: 0.01.sh,
                    ),
                    Text(
                      maxLines: 8,
                      overflow: TextOverflow.visible,
                      state.latestMovies.first.overview,
                      style: TextStyle(fontSize: 13.sp),
                      softWrap: true,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
