import 'package:movie_app/features/home/model/top_rate_movie_model.dart';

abstract class RemoteDataSourceRepository {
  Future<TopRateMovieModel> getTopRateMovie();
}
