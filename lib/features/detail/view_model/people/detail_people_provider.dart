import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/enum.dart';
import 'package:movie_app/features/detail/model/people/data_source/detail_people_impl.dart';
import 'package:movie_app/features/detail/model/people/data_source/detail_people_repository.dart';
import 'package:movie_app/features/detail/model/people/detail_people_model.dart';

import '../../model/people/more_people_model.dart';

class DetailPeopleProvider extends ChangeNotifier {
  final DetailPeopleRepository _detailPeopleRepository =
      DetailPeopleDataSourceImpl();

  ResultState? state;
  DetailPeopleModel? detailPeopleModel;
  MorePeopleModel? morePeopleModel;

  void getDetailPeople(int? peopleId) async {
    try {
      state = ResultState.loading;
      final source = await _detailPeopleRepository.getDetailPeople(peopleId);
      notifyListeners();
      if (source == null) {
        state = ResultState.noData;
        notifyListeners();
      } else {
        state = ResultState.hasData;
        detailPeopleModel = source;
        notifyListeners();
      }
    } catch (e) {
      state = ResultState.error;
      notifyListeners();
    }
  }

  void getMorePeople() async {
    try {
      state = ResultState.loading;
      final source = await _detailPeopleRepository.getMorePeople();
      notifyListeners();
      if (source == null) {
        state = ResultState.noData;
        notifyListeners();
      } else {
        state = ResultState.hasData;
        morePeopleModel = source;
        notifyListeners();
      }
    } catch (e) {
      state = ResultState.error;
      notifyListeners();
    }
  }
}
