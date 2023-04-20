import 'package:dio/dio.dart';
import 'package:movie_app/features/people/model/data_source/people_repository.dart';
import 'package:movie_app/features/people/model/popular_people_model.dart';

import '../../../../core/utils/env.dart';

class PeopleDataSourceImpl implements PeopleRepository {
  @override
  Future<PopularPeopleModel> getPopularPeople() async {
    try {
      var response = await Dio().get(
        '$basedURL/person/popular',
        queryParameters: {
          'api_key': apiKey,
          'language': 'en-US',
        },
      );
      if (response.statusCode == 200) {
        print(response.data);
        var result = PopularPeopleModel.fromJson(response.data);

        return result;
      } else {
        print('error ${response.statusCode}');
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }
}
