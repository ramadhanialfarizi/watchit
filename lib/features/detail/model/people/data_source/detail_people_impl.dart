import 'package:dio/dio.dart';
import 'package:movie_app/features/detail/model/people/data_source/detail_people_repository.dart';
import 'package:movie_app/features/detail/model/people/detail_people_model.dart';
import 'package:movie_app/features/detail/model/people/more_people_model.dart';

import '../../../../../core/utils/env.dart';

class DetailPeopleDataSourceImpl implements DetailPeopleRepository {
  @override
  Future<DetailPeopleModel> getDetailPeople(int? peopleId) async {
    try {
      var response = await Dio().get(
        '$basedURL/person/$peopleId',
        queryParameters: {
          'api_key': apiKey,
          'language': 'en-US',
        },
      );

      if (response.statusCode == 200) {
        print(response.data);
        var result = DetailPeopleModel.fromJson(response.data);

        return result;
      } else {
        print('error ${response.statusCode}');
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MorePeopleModel> getMorePeople() async {
    try {
      var response = await Dio().get(
        '$basedURL/person/popular',
        queryParameters: {
          'api_key': apiKey,
          'language': 'en-US',
        },
      );
      if (response.statusCode == 200) {
        //print(response.data);
        var result = MorePeopleModel.fromJson(response.data);

        return result;
      } else {
        // print('error ${response.statusCode}');
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }
}
