import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_app/core/injection_container.dart';
import 'package:tmdb_app/features/home/presentation/bloc/latestmovies/latestmovies_bloc.dart';
import 'package:tmdb_app/features/home/presentation/bloc/latestmovies/latestmovies_event.dart';
import 'package:tmdb_app/features/home/presentation/bloc/latestmovies/latestmovies_state.dart';
import 'package:tmdb_app/features/home/presentation/bloc/topratedmovies/topratedmovies_bloc.dart';
import 'package:tmdb_app/features/home/presentation/bloc/topratedmovies/topratedmovies_event.dart';
import 'package:tmdb_app/features/home/presentation/bloc/topratedmovies/topratedmovies_state.dart';

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
    return Scaffold(
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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Top Five.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    // Fetch only 5 movies
                    itemCount: (state.topRatedMovies.length == 5)
                        ? state.topRatedMovies.length
                        : state.topRatedMovies.sublist(0, 5).length,
                    itemBuilder: (context, int index) {
                      return Text(state.topRatedMovies[index].title ?? "Title");
                    },
                  )
                ],
              );
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
              return Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Latest.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "SEE MORE",
                        style: TextStyle(
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
                          const FlutterLogo(),
                          Text(state.latestMovies.first.title)
                        ],
                      ),
                    ],
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
