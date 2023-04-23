import 'package:flutter/material.dart';
import 'package:movie_app/core/global_widget/empty_data.dart';
import 'package:movie_app/core/global_widget/error.dart';
import 'package:movie_app/core/utils/enum.dart';
import 'package:movie_app/features/home/view/widget/movie/now_playing_movie.dart';
import 'package:movie_app/features/home/view/widget/movie/popular_movie.dart';
import 'package:movie_app/features/home/view/widget/movie/top_rate_movie.dart';
import 'package:movie_app/features/home/view/widget/movie/upcoming_movie.dart';
import 'package:movie_app/features/home/view_model/movie/movie_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/global_widget/sidebar.dart';

class MovieListPages extends StatefulWidget {
  const MovieListPages({super.key});

  @override
  State<MovieListPages> createState() => _MovieListPagesState();
}

class _MovieListPagesState extends State<MovieListPages> {
  @override
  void initState() {
    getTopRatedMovie();
    getPopularMovie();
    getNowPlayingMovie();
    getUpcomingMovie();
    super.initState();
  }

  void getTopRatedMovie() {
    context.read<MovieProvider>().getTopRateMovie();
  }

  void getPopularMovie() {
    context.read<MovieProvider>().getPopularMovie();
  }

  void getNowPlayingMovie() {
    context.read<MovieProvider>().getNowPlayingMovie();
  }

  void getUpcomingMovie() {
    context.read<MovieProvider>().getUpcomingMovie();
  }

  Future refreshPage() async {
    getTopRatedMovie();
    getPopularMovie();
    getNowPlayingMovie();
    getUpcomingMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text(
          'Movie',
          style:
              TextStyle(color: Color(0xFFF44E42), fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: RefreshIndicator(
        onRefresh: refreshPage,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Now playing',
                    style: TextStyle(
                        color: Color(0xFFF44E42),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Consumer<MovieProvider>(
                    builder: (context, nowPlayingMovie, child) {
                      if (nowPlayingMovie.state == ResultState.loading) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 5.3,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (nowPlayingMovie.state == ResultState.hasData) {
                        return NowPlayingMovie(
                          nowPlayingMovieModel:
                              nowPlayingMovie.nowPlayingMovieModel,
                        );
                      } else if (nowPlayingMovie.state == ResultState.noData) {
                        return const EmptyData();
                      } else {
                        return const ErrorData();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const Text(
                    'Top rated',
                    style: TextStyle(
                        color: Color(0xFFF44E42),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Consumer<MovieProvider>(
                    builder: (context, topRateMovie, child) {
                      if (topRateMovie.state == ResultState.loading) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 5.3,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (topRateMovie.state == ResultState.hasData) {
                        return TopRateMovie(
                          topRateMovieModel: topRateMovie.topRateMovieModelList,
                        );
                      } else if (topRateMovie.state == ResultState.noData) {
                        return const EmptyData();
                      } else {
                        return const ErrorData();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const Text(
                    'Popular',
                    style: TextStyle(
                        color: Color(0xFFF44E42),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Consumer<MovieProvider>(
                    builder: (context, popularMovie, child) {
                      if (popularMovie.state == ResultState.loading) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 5.3,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (popularMovie.state == ResultState.hasData) {
                        return PopularMovie(
                          popularMovieModel: popularMovie.popularMovieModel,
                        );
                      } else if (popularMovie.state == ResultState.noData) {
                        return const EmptyData();
                      } else {
                        return const ErrorData();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const Text(
                    'Upcoming',
                    style: TextStyle(
                        color: Color(0xFFF44E42),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Consumer<MovieProvider>(
                    builder: (context, upcomingMovie, child) {
                      if (upcomingMovie.state == ResultState.loading) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 5.3,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (upcomingMovie.state == ResultState.hasData) {
                        return UpcomingMovie(
                          upcomingMovieModel: upcomingMovie.upcomingMovieModel,
                        );
                      } else if (upcomingMovie.state == ResultState.noData) {
                        return const EmptyData();
                      } else {
                        return const ErrorData();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
