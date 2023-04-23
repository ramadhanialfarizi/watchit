import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/enum.dart';
import 'package:movie_app/features/detail/view/widget/movie/detail_movie.dart';
import 'package:movie_app/features/detail/view_model/movie/detail_movie_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/global_widget/empty_data.dart';
import '../../../core/global_widget/error.dart';

class DetailMoviePage extends StatefulWidget {
  const DetailMoviePage({super.key, required this.movieId});

  final int? movieId;

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  final String? type = 'movie';

  @override
  void initState() {
    getDetailMoviebyId();
    super.initState();
  }

  void getDetailMoviebyId() {
    context.read<DetailMovieProvider>().getDetailMovie(widget.movieId);
  }

  Future refreshPage() async {
    getDetailMoviebyId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: refreshPage,
        child: Center(
          child: SingleChildScrollView(
            child: Consumer<DetailMovieProvider>(
              builder: (context, detailMovieValue, child) {
                if (detailMovieValue.state == ResultState.loading) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 1,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (detailMovieValue.state == ResultState.hasData) {
                  return DetailMovie(
                      type: type,
                      detailMovieModel: detailMovieValue.detailMovieModel);
                } else if (detailMovieValue.state == ResultState.noData) {
                  return const EmptyData();
                } else if (detailMovieValue.state == ResultState.error) {
                  return const ErrorData();
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
