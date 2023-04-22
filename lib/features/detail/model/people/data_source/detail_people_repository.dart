import 'package:movie_app/features/detail/model/people/detail_people_model.dart';
import 'package:movie_app/features/detail/model/people/more_people_model.dart';

abstract class DetailPeopleRepository {
  Future<DetailPeopleModel> getDetailPeople(int? peopleId);

  Future<MorePeopleModel> getMorePeople();
}
