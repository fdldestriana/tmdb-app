import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmdb_app/core/constants/app_constants.dart';
import 'package:tmdb_app/features/home/presentation/bloc/topratedmovies/topratedmovies_state.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({super.key, required this.state});
  final GetTopRatedMoviesLoaded state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: AppConstants.topFive,
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
          SizedBox(
            height: 0.33.sh,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              // Fetch only 5 movies
              itemCount: (state.topRatedMovies.length == 5)
                  ? state.topRatedMovies.length
                  : state.topRatedMovies.sublist(0, 5).length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 0.33.sh,
                  width: 0.80.sw,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.04.sw),
                        child: Image.network(
                            height: 0.25.sh,
                            width: 0.80.sw,
                            fit: BoxFit.fill,
                            "${AppConstants.imageBaseUrl}${state.topRatedMovies[index].backdropPath}"),
                      ),
                      Text("${state.topRatedMovies[index].title}"),
                      Row(
                        children: [
                          Text("${state.topRatedMovies[index].voteAverage}"),
                        ],
                      )
                    ],
                  ),
                );
                // Text(
                //     state.topRatedMovies[index].title ?? "Title");
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 0.05.sw);
              },
            ),
          )
        ],
      ),
    );
  }
}
