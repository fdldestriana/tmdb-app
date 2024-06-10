import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmdb_app/core/injection_container.dart';
import 'package:tmdb_app/features/home/presentation/bloc/latestmovies/latestmovies_bloc.dart';
import 'package:tmdb_app/features/home/presentation/bloc/latestmovies/latestmovies_event.dart';
import 'package:tmdb_app/features/home/presentation/bloc/latestmovies/latestmovies_state.dart';
import 'package:tmdb_app/features/home/presentation/bloc/topratedmovies/topratedmovies_bloc.dart';
import 'package:tmdb_app/features/home/presentation/bloc/topratedmovies/topratedmovies_event.dart';
import 'package:tmdb_app/features/home/presentation/bloc/topratedmovies/topratedmovies_state.dart';
import 'package:tmdb_app/features/home/presentation/widgets/latest_movie.dart';
import 'package:tmdb_app/features/home/presentation/widgets/top_rated_movies.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<LatestMoviesBloc>()),
        BlocProvider(create: (_) => sl<TopRatedMoviesBloc>())
      ],
      child: Scaffold(
        appBar: AppBar(),
        body: const HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<LatestMoviesBloc>(context).add(GetLatestMoviesEvent());
    BlocProvider.of<TopRatedMoviesBloc>(context).add(GetTopRatedMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: Scaffold(
        backgroundColor: const Color(0x0001b207),
        body: ListView(
          shrinkWrap: true,
          children: [
            BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
              builder: (context, state) {
                if (state is GetTopRatedMoviesInitial ||
                    state is GetTopRatedMoviesLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is GetTopRatedMoviesError) {
                  return Center(child: Text(state.toString()));
                }
                state as GetTopRatedMoviesLoaded;
                return TopRatedMovies(state: state);
              },
            ),
            BlocBuilder<LatestMoviesBloc, LatestMoviesState>(
              builder: (context, state) {
                if (state is GetLatestMoviesInitial ||
                    state is GetLatestMoviesLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is GetLatestMoviesError) {
                  return Center(child: Text(state.toString()));
                }
                state as GetLatestMoviesLoaded;
                return LatestMovie(state: state);
              },
            )
          ],
        ),
      ),
    );
  }
}
