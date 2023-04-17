import 'package:dio/dio.dart';
import 'package:movie_app/features/home/model/tv_show/airing_today_model.dart';
import 'package:movie_app/features/home/model/tv_show/data_source/tv_show_repository.dart';
import 'package:movie_app/features/home/model/tv_show/on_the_air_model.dart';
import 'package:movie_app/features/home/model/tv_show/popular_tv_show_model.dart';
import 'package:movie_app/features/home/model/tv_show/top_rated_model.dart';

import '../../../../../core/utils/env.dart';

class TvShowDataSourceImpl implements TvShowRepository {
  @override
  Future<OnTheAirModel> getOnTheAirTvShow() async {
    try {
      var response = await Dio().get(
        '$basedURL/tv/on_the_air',
        queryParameters: {
          'api_key': apiKey,
          'language': 'en-US',
        },
      );

      if (response.statusCode == 200) {
        // print(response.data);
        var result = OnTheAirModel.fromJson(response.data);

        return result;
      } else {
        // print('fail to load data, status code: ${response.statusCode}');
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AiringTodayModel> getAiringTodayTvShow() async {
    try {
      var response = await Dio().get(
        '$basedURL/tv/airing_today',
        queryParameters: {
          'api_key': apiKey,
          'language': 'en-US',
        },
      );

      if (response.statusCode == 200) {
        var result = AiringTodayModel.fromJson(response.data);

        return result;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TopRatedTvShowModel> getTopRatedTvShow() async {
    try {
      var response = await Dio().get(
        '$basedURL/tv/top_rated',
        queryParameters: {
          'api_key': apiKey,
          'language': 'en-US',
        },
      );

      if (response.statusCode == 200) {
        var result = TopRatedTvShowModel.fromJson(response.data);

        return result;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PopularTvShowModel> getPopularTvShow() async {
    try {
      var response = await Dio().get(
        '$basedURL/tv/popular',
        queryParameters: {
          'api_key': apiKey,
          'language': 'en-US',
        },
      );

      if (response.statusCode == 200) {
        print(response.data);
        var result = PopularTvShowModel.fromJson(response.data);

        return result;
      } else {
        print('fail to load data, status code: ${response.statusCode}');
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }
}
