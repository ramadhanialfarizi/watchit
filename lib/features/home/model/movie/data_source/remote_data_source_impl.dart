import 'package:dio/dio.dart';
import 'package:movie_app/core/utils/env.dart';
import 'package:movie_app/features/home/model/movie/data_source/remote_data_source_repository.dart';
import 'package:movie_app/features/home/model/movie/now_playing_movie_model.dart';
import 'package:movie_app/features/home/model/movie/popular_movie_model.dart';
import 'package:movie_app/features/home/model/movie/upcoming_movie_model.dart';

import '../top_rate_movie_model.dart';

class RemoteDataSourceImpl implements RemoteDataSourceRepository {
  @override
  Future<TopRateMovieModel> getTopRateMovie() async {
    try {
      var response = await Dio().get(
        '$basedURL/movie/top_rated',
        queryParameters: {
          'api_key': apiKey,
          'language': 'en-US',
        },
      );
      if (response.statusCode == 200) {
        var result = TopRateMovieModel.fromJson(response.data);

        return result;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PopularMovieModel> getPopularMovie() async {
    try {
      var response = await Dio().get(
        '$basedURL/movie/popular',
        queryParameters: {
          'api_key': apiKey,
          'language': 'en-US',
        },
      );

      if (response.statusCode == 200) {
        //print(response.data);
        var result = PopularMovieModel.fromJson(response.data);

        return result;
      } else {
        //print('fail load data, error code = ${response.statusCode}');
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NowPlayingMovieModel> getNowPlayingMovie() async {
    try {
      var response = await Dio().get(
        '$basedURL/movie/now_playing',
        queryParameters: {
          'api_key': apiKey,
          'language': 'en-US',
        },
      );

      if (response.statusCode == 200) {
        //print(response.data);
        var result = NowPlayingMovieModel.fromJson(response.data);

        return result;
      } else {
        //print('fail load data, error code = ${response.statusCode}');
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UpcomingMovieModel> getUpcomingMovie() async {
    try {
      var response = await Dio().get(
        '$basedURL/movie/upcoming',
        queryParameters: {
          'api_key': apiKey,
          'language': 'en-US',
        },
      );

      if (response.statusCode == 200) {
        var result = UpcomingMovieModel.fromJson(response.data);

        return result;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }
}
