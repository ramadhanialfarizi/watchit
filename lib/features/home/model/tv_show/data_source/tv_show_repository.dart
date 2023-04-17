import 'package:movie_app/features/home/model/tv_show/airing_today_model.dart';
import 'package:movie_app/features/home/model/tv_show/on_the_air_model.dart';
import 'package:movie_app/features/home/model/tv_show/popular_tv_show_model.dart';
import 'package:movie_app/features/home/model/tv_show/top_rated_model.dart';

abstract class TvShowRepository {
  Future<OnTheAirModel> getOnTheAirTvShow();

  Future<AiringTodayModel> getAiringTodayTvShow();

  Future<TopRatedTvShowModel> getTopRatedTvShow();

  Future<PopularTvShowModel> getPopularTvShow();
}
