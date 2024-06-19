// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:tmdb_app/core/constants/app_constants.dart';
// import 'package:tmdb_app/core/injection_container.dart';
// import 'package:tmdb_app/features/discover/presentation/bloc/allgenres/allgenres_bloc.dart';
// import 'package:tmdb_app/features/discover/presentation/bloc/allgenres/allgenres_state.dart';
// import 'package:tmdb_app/features/discover/presentation/bloc/movies_by_genre/movies_by_genre_bloc.dart';
// import 'package:tmdb_app/features/discover/presentation/bloc/movies_by_genre/movies_by_genre_event.dart';
// import 'package:tmdb_app/features/discover/presentation/bloc/movies_by_genre/movies_by_genre_state.dart';
// import 'package:tmdb_app/features/home/presentation/widgets/bookmark_button.dart';

// class DiscoverPageByGenrePage extends StatefulWidget {
//   const DiscoverPageByGenrePage({required this.genreId, super.key});
//   final int genreId;

//   @override
//   State<DiscoverPageByGenrePage> createState() =>
//       _DiscoverPageByGenrePageState();
// }

// class _DiscoverPageByGenrePageState extends State<DiscoverPageByGenrePage> {
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<MoviesByGenreBloc>(context)
//         .add(GetMoviesByGenreEvent(genreId: widget.genreId));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: const DiscoverByGenreBody(),
//     );
//   }
// }

// class DiscoverByGenreBody extends StatelessWidget {
//   const DiscoverByGenreBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(375, 812),
//       child: Scaffold(
//         backgroundColor: const Color(0x0001b207),
//         body: BlocBuilder<MoviesByGenreBloc, MoviesByGenreState>(
//           builder: (context, state) {
//             if (state is GetMoviesByGenreInitial ||
//                 state is GetMoviesByGenreLoading) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             if (state is GetMoviesByGenreError) {
//               return Center(child: Text(state.toString()));
//             }
//             state as GetMoviesByGenreLoaded;
//             return Padding(
//               padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text.rich(
//                       TextSpan(
//                         children: [
//                           TextSpan(
//                             text: AppConstants.discover,
//                             style: TextStyle(
//                                 fontSize: 30.sp, fontWeight: FontWeight.bold),
//                           ),
//                           TextSpan(
//                             text: '.',
//                             style: TextStyle(
//                                 color: const Color(0xFFFFC700),
//                                 fontSize: 30.sp,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 0.01.sh,
//                     ),
//                     BlocBuilder<AllGenresBloc, AllGenresState>(
//                       builder: (context, state) {
//                         if (state is GetAllGenresLoading) {
//                           return Container();
//                         }
//                         state as GetAllGenresLoaded;
//                         return SizedBox(
//                           height: 0.03.sh,
//                           child: ListView.separated(
//                             itemBuilder: (context, index) {
//                               return InkWell(
//                                 onTap: () {
//                                   BlocProvider.of<MoviesByGenreBloc>(context)
//                                       .add(
//                                     GetMoviesByGenreEvent(
//                                         genreId: state.allGenres[index].id),
//                                   );
//                                 },
//                                 child: FittedBox(
//                                   fit: BoxFit.fitWidth,
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       color: const Color(0xFF2A2A2A),
//                                       borderRadius:
//                                           BorderRadius.circular(0.07.sw),
//                                     ),
//                                     child: Text(state.allGenres[index].name),
//                                   ),
//                                 ),
//                               );
//                             },
//                             itemCount: state.allGenres.length,
//                             separatorBuilder: (context, index) {
//                               return SizedBox(
//                                 width: 0.03.sw,
//                               );
//                             },
//                             scrollDirection: Axis.horizontal,
//                             shrinkWrap: true,
//                           ),
//                         );
//                       },
//                     ),
//                     SizedBox(
//                       height: 0.02.sh,
//                     ),
//                     GridView.builder(
//                       shrinkWrap: true,
//                       physics: const ScrollPhysics(),
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           childAspectRatio: 1 / 1.97,
//                           crossAxisCount: 2,
//                           crossAxisSpacing: 0.04.sw,
//                           mainAxisSpacing: 0.02.sh),
//                       itemCount: state.moviesEntity.length,
//                       itemBuilder: (context, index) {
//                         Widget movieBackdrop;
//                         (state.moviesEntity[index].backdropPath == null)
//                             ? movieBackdrop = Stack(children: [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius:
//                                         BorderRadius.circular(0.04.sw),
//                                     color: Colors.teal,
//                                   ),
//                                   height: 0.34.sh,
//                                   width: 0.49.sw,
//                                 ),
//                                 Positioned(
//                                   right: 0.04.sw,
//                                   top: 0.02.sh,
//                                   child: const BookmarkButton(),
//                                 )
//                               ])
//                             : movieBackdrop = Stack(
//                                 children: [
//                                   ClipRRect(
//                                     borderRadius:
//                                         BorderRadius.circular(0.04.sw),
//                                     child: Image.network(
//                                         fit: BoxFit.fitHeight,
//                                         height: 0.34.sh,
//                                         width: 0.49.sw,
//                                         "${AppConstants.imageBaseUrl}${state.moviesEntity[index].backdropPath}"),
//                                   ),
//                                   Positioned(
//                                     right: 0.04.sw,
//                                     top: 0.02.sh,
//                                     child: const BookmarkButton(),
//                                   )
//                                 ],
//                               );
//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             movieBackdrop,
//                             Expanded(
//                               child: Text(
//                                 "${state.moviesEntity[index].title}",
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 18.sp,
//                                 ),
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   "${state.moviesEntity[index].voteAverage}",
//                                   style: TextStyle(fontSize: 18.sp),
//                                 ),
//                               ],
//                             )
//                           ],
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
