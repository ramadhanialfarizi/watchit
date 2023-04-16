import 'package:movie_app/features/home/model/data_source/remote_data_source_repository.dart';
import 'package:movie_app/features/home/model/top_rate_movie_model.dart';

class RemoteDataSourceImpl implements RemoteDataSourceRepository {
  @override
  Future<TopRateMovieModel> getTopRateMovie() async {
    // TODO: implement getTopRateMovie
    throw UnimplementedError();
  }
}
