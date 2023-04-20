import 'package:movie_app/features/people/model/popular_people_model.dart';

abstract class PeopleRepository {
  Future<PopularPeopleModel> getPopularPeople();
}
