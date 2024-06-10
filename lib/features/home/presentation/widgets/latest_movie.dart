import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmdb_app/core/constants/app_constants.dart';
import 'package:tmdb_app/features/home/presentation/bloc/latestmovies/latestmovies_state.dart';

class LatestMovie extends StatelessWidget {
  const LatestMovie({super.key, required this.state});

  final GetLatestMoviesLoaded state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppConstants.latest,
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                AppConstants.seeMore,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          ListView(
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  (state.latestMovies.first.backdropPath == null)
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.04.sw),
                            color: Colors.teal,
                          ),
                          height: 0.34.sh,
                          width: 0.49.sw,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(0.04.sw),
                          child: Image.network(
                              height: 0.34.sh,
                              width: 0.49.sw,
                              "${AppConstants.imageBaseUrl}${state.latestMovies.first.backdropPath}"),
                        ),
                  SizedBox(width: 0.05.sw),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        state.latestMovies.first.title,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
