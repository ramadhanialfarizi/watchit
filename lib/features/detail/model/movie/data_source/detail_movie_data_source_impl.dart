import 'package:dio/dio.dart';
import 'package:movie_app/features/detail/model/movie/data_source/detail_movie_repository.dart';
import 'package:movie_app/features/detail/model/movie/detail_movie_model.dart';

import '../../../../../core/utils/env.dart';

class DetailMovieDataSourceImpl implements DetailMovieRepository {
  @override
  Future<DetailMovieModel> getDetailMovie(int? movieId) async {
    try {
      var response = await Dio().get(
        '$basedURL/movie/$movieId',
        queryParameters: {
          'api_key': apiKey,
          'language': 'en-US',
        },
      );
      if (response.statusCode == 200) {
        //print(response.data);
        var result = DetailMovieModel.fromJson(response.data);

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
