import 'package:movie_app/features/detail/model/movie/detail_movie_model.dart';

abstract class DetailMovieRepository {
  Future<DetailMovieModel> getDetailMovie(int? movieId);
}
