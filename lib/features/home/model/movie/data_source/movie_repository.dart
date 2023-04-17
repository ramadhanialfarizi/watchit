import 'package:movie_app/features/home/model/movie/now_playing_movie_model.dart';
import 'package:movie_app/features/home/model/movie/popular_movie_model.dart';
import 'package:movie_app/features/home/model/movie/upcoming_movie_model.dart';

import '../top_rate_movie_model.dart';

abstract class RemoteDataSourceRepository {
  Future<TopRateMovieModel> getTopRateMovie();

  Future<PopularMovieModel> getPopularMovie();

  Future<NowPlayingMovieModel> getNowPlayingMovie();

  Future<UpcomingMovieModel> getUpcomingMovie();
}
