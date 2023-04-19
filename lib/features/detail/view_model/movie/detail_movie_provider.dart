import 'package:flutter/material.dart';
import 'package:movie_app/features/detail/model/movie/data_source/detail_movie_data_source_impl.dart';
import 'package:movie_app/features/detail/model/movie/data_source/detail_movie_repository.dart';
import 'package:movie_app/features/detail/model/movie/detail_movie_model.dart';

import '../../../../core/utils/enum.dart';

class DetailMovieProvider extends ChangeNotifier {
  final DetailMovieRepository detailMovieRepository =
      DetailMovieDataSourceImpl();

  ResultState? state;
  DetailMovieModel? detailMovieModel;

  void getDetailMovie(int? movieId) async {
    try {
      state = ResultState.loading;
      final source = await detailMovieRepository.getDetailMovie(movieId);
      notifyListeners();
      if (source == null) {
        state = ResultState.noData;
        notifyListeners();
      } else {
        state = ResultState.hasData;
        detailMovieModel = source;
        notifyListeners();
      }
    } catch (e) {
      state = ResultState.error;
      notifyListeners();
    }
  }
}
