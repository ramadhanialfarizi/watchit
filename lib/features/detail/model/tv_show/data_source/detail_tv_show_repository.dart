import 'package:movie_app/features/detail/model/tv_show/detail_tv_show_model.dart';

abstract class DetailTvShowRepository {
  Future<DetailTvShowModel> getTvShowDetail(int? tvId);
}
