import 'package:flutter/material.dart';
import 'package:movie_app/features/home/model/movie/data_source/movie_data_source_impl.dart';

import 'package:movie_app/features/home/model/movie/now_playing_movie_model.dart';
import 'package:movie_app/features/home/model/movie/popular_movie_model.dart';
import 'package:movie_app/features/home/model/movie/top_rate_movie_model.dart';
import 'package:movie_app/features/home/model/movie/upcoming_movie_model.dart';

import '../../../../core/utils/enum.dart';
import '../../model/movie/data_source/movie_repository.dart';

class MovieProvider extends ChangeNotifier {
  final RemoteDataSourceRepository _remoteDataSourceRepository =
      RemoteDataSourceImpl();
  ResultState? state;

  TopRateMovieModel? topRateMovieModelList;
  PopularMovieModel? popularMovieModel;
  NowPlayingMovieModel? nowPlayingMovieModel;
  UpcomingMovieModel? upcomingMovieModel;

  // MovieProvider() {
  //   getTopRateMovie();
  // }

  void getTopRateMovie() async {
    try {
      state = ResultState.loading;
      final source = await _remoteDataSourceRepository.getTopRateMovie();
      notifyListeners();
      if (source.results.isEmpty) {
        state = ResultState.noData;
        notifyListeners();
      } else {
        state = ResultState.hasData;
        topRateMovieModelList = source;
        notifyListeners();
      }
    } catch (e) {
      state = ResultState.error;
      notifyListeners();
    }
  }

  void getPopularMovie() async {
    try {
      state = ResultState.loading;
      final source = await _remoteDataSourceRepository.getPopularMovie();
      notifyListeners();

      if (source.results.isEmpty) {
        state = ResultState.noData;
        notifyListeners();
      } else {
        state = ResultState.hasData;
        popularMovieModel = source;
        notifyListeners();
      }
    } catch (e) {
      state = ResultState.error;
      notifyListeners();
    }
  }

  void getNowPlayingMovie() async {
    try {
      state = ResultState.loading;
      final source = await _remoteDataSourceRepository.getNowPlayingMovie();
      notifyListeners();
      if (source.results.isEmpty) {
        state = ResultState.noData;
        notifyListeners();
      } else {
        state = ResultState.hasData;
        nowPlayingMovieModel = source;
        notifyListeners();
      }
    } catch (e) {
      state = ResultState.error;
      notifyListeners();
    }
  }

  void getUpcomingMovie() async {
    try {
      state = ResultState.loading;
      final source = await _remoteDataSourceRepository.getUpcomingMovie();
      notifyListeners();
      if (source.results.isEmpty) {
        state = ResultState.noData;
        notifyListeners();
      } else {
        state = ResultState.hasData;
        upcomingMovieModel = source;
        notifyListeners();
      }
    } catch (e) {
      state = ResultState.error;
      notifyListeners();
    }
  }
}
