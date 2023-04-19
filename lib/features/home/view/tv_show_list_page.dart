import 'package:flutter/material.dart';
import 'package:movie_app/features/home/view/widget/tv_show/airing_today_tv_show.dart';
import 'package:movie_app/features/home/view/widget/tv_show/on_the_air_tv_show.dart';
import 'package:movie_app/features/home/view/widget/tv_show/popular_tv_show.dart';
import 'package:movie_app/features/home/view/widget/tv_show/top_rated_tv_show.dart';
import 'package:movie_app/features/home/view_model/tv_show/tv_show_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/global_widget/empty_data.dart';
import '../../../core/global_widget/error.dart';
import '../../../core/global_widget/sidebar.dart';
import '../../../core/utils/enum.dart';

class TvShowListPages extends StatefulWidget {
  const TvShowListPages({super.key});

  @override
  State<TvShowListPages> createState() => _TvShowListPagesState();
}

class _TvShowListPagesState extends State<TvShowListPages> {
  String? status = 'tvshow';

  @override
  void initState() {
    getOnTheAirTvShow();
    getAiringTodayTvShow();
    getTopRatedTvShow();
    getPopularTvShow();
    super.initState();
  }

  void getOnTheAirTvShow() {
    context.read<TvShowProvider>().getOnTheAirTvShow();
  }

  void getAiringTodayTvShow() {
    context.read<TvShowProvider>().getAiringTodayTvShow();
  }

  void getTopRatedTvShow() {
    context.read<TvShowProvider>().getTopRatedTvShow();
  }

  void getPopularTvShow() {
    context.read<TvShowProvider>().getPopularTvShow();
  }

  Future refreshPage() async {
    getOnTheAirTvShow();
    getAiringTodayTvShow();
    getTopRatedTvShow();
    getPopularTvShow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text(
          'TV Show',
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
                    'On the air',
                    style: TextStyle(
                        color: Color(0xFFF44E42),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Consumer<TvShowProvider>(
                    builder: (context, onTheAirValue, child) {
                      //print(onTheAirValue.onTheAirModel);
                      if (onTheAirValue.state == ResultState.loading) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 5.3,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (onTheAirValue.state == ResultState.hasData) {
                        return OnTheAirTvShow(
                          onTheAirModel: onTheAirValue.onTheAirModel,
                        );
                      } else if (onTheAirValue.state == ResultState.noData) {
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
                    'Airing today',
                    style: TextStyle(
                        color: Color(0xFFF44E42),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Consumer<TvShowProvider>(
                    builder: (context, airingTodayValue, child) {
                      if (airingTodayValue.state == ResultState.loading) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 5.3,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (airingTodayValue.state ==
                          ResultState.hasData) {
                        return AiringTodayTvShow(
                            airingTodayModel:
                                airingTodayValue.airingTodayModel);
                      } else if (airingTodayValue.state == ResultState.noData) {
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
                    'Top Rated',
                    style: TextStyle(
                        color: Color(0xFFF44E42),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Consumer<TvShowProvider>(
                    builder: (context, topRatedValue, child) {
                      if (topRatedValue.state == ResultState.loading) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 5.3,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (topRatedValue.state == ResultState.hasData) {
                        return TopRatedTvShow(
                          topRatedTvShowModel:
                              topRatedValue.topRatedTvShowModel,
                        );
                      } else if (topRatedValue.state == ResultState.noData) {
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
                  Consumer<TvShowProvider>(
                    builder: (context, popularValue, child) {
                      if (popularValue.state == ResultState.loading) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 5.3,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (popularValue.state == ResultState.hasData) {
                        return PopularTvShow(
                            popularTvShowModel:
                                popularValue.popularTvShowModel);
                      } else if (popularValue.state == ResultState.noData) {
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
