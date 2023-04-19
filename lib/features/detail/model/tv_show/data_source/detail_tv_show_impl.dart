import 'package:dio/dio.dart';
import 'package:movie_app/features/detail/model/tv_show/data_source/detail_tv_show_repository.dart';
import 'package:movie_app/features/detail/model/tv_show/detail_tv_show_model.dart';

import '../../../../../core/utils/env.dart';

class DetailTvShowDataSourceImpl implements DetailTvShowRepository {
  @override
  Future<DetailTvShowModel> getTvShowDetail(int? tvId) async {
    try {
      var response = await Dio().get(
        '$basedURL/tv/$tvId',
        queryParameters: {
          'api_key': apiKey,
          'language': 'en-US',
        },
      );

      if (response.statusCode == 200) {
        print(response.data);
        var result = DetailTvShowModel.fromJson(response.data);

        print(result);

        return result;
      } else {
        //print('error ${response.statusCode}');
        throw Exception();
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
