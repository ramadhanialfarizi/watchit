import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/enum.dart';
import 'package:movie_app/features/detail/model/tv_show/data_source/detail_tv_show_impl.dart';
import 'package:movie_app/features/detail/model/tv_show/data_source/detail_tv_show_repository.dart';
import 'package:movie_app/features/detail/model/tv_show/detail_tv_show_model.dart';
import 'package:movie_app/features/favorite/model/tv_show_favorite_model.dart';
import 'package:movie_app/features/home/model/tv_show/data_source/tv_show_repository.dart';

import '../../../../core/helper/cloud_firestore_helper.dart';

class DetailTvShowProvider extends ChangeNotifier {
  final DetailTvShowRepository _detailTvShowRepository =
      DetailTvShowDataSourceImpl();
  final CloudFireStoreHelper _cloudFireStoreHelper = CloudFireStoreHelper();

  ResultState? state;
  DetailTvShowModel? detailTvShowModel;

  void getDetailTvShow(int? tvId) async {
    try {
      state = ResultState.loading;
      final source = await _detailTvShowRepository.getTvShowDetail(tvId);
      notifyListeners();
      if (source == null) {
        state = ResultState.noData;
        notifyListeners();
      } else {
        state = ResultState.hasData;
        detailTvShowModel = source;
        notifyListeners();
      }
    } catch (e) {
      state = ResultState.error;
      notifyListeners();
    }
  }

  void addTvShowFavorite(TvShowFavoriteModel tvShowFavoriteModel) async {
    await _cloudFireStoreHelper.addTvShowFavorite(tvShowFavoriteModel);
    notifyListeners();
  }
}
