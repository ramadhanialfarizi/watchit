import 'package:flutter/material.dart';
import 'package:movie_app/features/home/model/tv_show/airing_today_model.dart';
import 'package:movie_app/features/home/model/tv_show/data_source/tv_show_data_source_impl.dart';
import 'package:movie_app/features/home/model/tv_show/data_source/tv_show_repository.dart';
import 'package:movie_app/features/home/model/tv_show/on_the_air_model.dart';
import 'package:movie_app/features/home/model/tv_show/popular_tv_show_model.dart';
import 'package:movie_app/features/home/model/tv_show/top_rated_model.dart';

import '../../../../core/utils/enum.dart';

class TvShowProvider extends ChangeNotifier {
  final TvShowRepository tvShowRepository = TvShowDataSourceImpl();

  ResultState? state;
  OnTheAirModel? onTheAirModel;
  AiringTodayModel? airingTodayModel;
  TopRatedTvShowModel? topRatedTvShowModel;
  PopularTvShowModel? popularTvShowModel;

  void getOnTheAirTvShow() async {
    try {
      state = ResultState.loading;
      final source = await tvShowRepository.getOnTheAirTvShow();
      notifyListeners();
      if (source.results.isEmpty) {
        state = ResultState.noData;
        notifyListeners();
      } else {
        state = ResultState.hasData;
        onTheAirModel = source;
        notifyListeners();
      }
    } catch (e) {
      state = ResultState.error;
      notifyListeners();
    }
  }

  void getAiringTodayTvShow() async {
    try {
      state = ResultState.loading;
      final source = await tvShowRepository.getAiringTodayTvShow();
      notifyListeners();
      if (source.results.isEmpty) {
        state = ResultState.noData;
        notifyListeners();
      } else {
        state = ResultState.hasData;
        airingTodayModel = source;
        notifyListeners();
      }
    } catch (e) {
      state = ResultState.error;
      notifyListeners();
    }
  }

  void getTopRatedTvShow() async {
    try {
      state = ResultState.loading;
      final source = await tvShowRepository.getTopRatedTvShow();
      notifyListeners();
      if (source.results.isEmpty) {
        state = ResultState.noData;
        notifyListeners();
      } else {
        state = ResultState.hasData;
        topRatedTvShowModel = source;
        notifyListeners();
      }
    } catch (e) {
      state = ResultState.error;
      notifyListeners();
    }
  }

  void getPopularTvShow() async {
    try {
      state = ResultState.loading;
      final source = await tvShowRepository.getPopularTvShow();
      notifyListeners();
      if (source.results.isEmpty) {
        state = ResultState.noData;
        notifyListeners();
      } else {
        state = ResultState.hasData;
        popularTvShowModel = source;
        notifyListeners();
      }
    } catch (e) {
      state = ResultState.error;
      notifyListeners();
    }
  }
}
