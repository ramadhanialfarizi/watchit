import 'package:flutter/material.dart';
import 'package:movie_app/features/people/model/data_source/people_data_source_impl.dart';
import 'package:movie_app/features/people/model/data_source/people_repository.dart';
import 'package:movie_app/features/people/model/popular_people_model.dart';

import '../../../core/utils/enum.dart';

class PeopleProvider extends ChangeNotifier {
  final PeopleRepository _peopleRepository = PeopleDataSourceImpl();

  ResultState? state;
  PopularPeopleModel? popularPeopleModel;

  void getPopularPeople() async {
    try {
      state = ResultState.loading;
      final source = await _peopleRepository.getPopularPeople();
      notifyListeners();
      if (source.results!.isEmpty) {
        state = ResultState.noData;
        notifyListeners();
      } else {
        state = ResultState.hasData;
        popularPeopleModel = source;
        notifyListeners();
      }
    } catch (e) {
      state = ResultState.error;
      notifyListeners();
    }
  }
}
