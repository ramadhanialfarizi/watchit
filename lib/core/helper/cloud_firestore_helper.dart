import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/features/favorite/model/movie_favorite_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/features/favorite/model/tv_show_favorite_model.dart';

class CloudFireStoreHelper {
  final curentUser = FirebaseAuth.instance;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future addMovieFavorite(MovieFavoriteModel movieFavoriteModel) async {
    CollectionReference collectionReference = firebaseFirestore
        .collection('favorite_db')
        .doc(curentUser.currentUser!.email)
        .collection('favorite');

    try {
      final favoriteData = await collectionReference.add({
        'type': movieFavoriteModel.type,
        'id': movieFavoriteModel.id,
        'title': movieFavoriteModel.title,
        'imagePath': movieFavoriteModel.imagePath,
      });

      return favoriteData;
    } catch (e) {
      rethrow;
    }
  }

  Future addTvShowFavorite(TvShowFavoriteModel tvShowFavoriteModel) async {
    CollectionReference collectionReference = firebaseFirestore
        .collection('favorite_db')
        .doc(curentUser.currentUser!.email)
        .collection('favorite');

    try {
      final favoriteData = await collectionReference.add({
        'type': tvShowFavoriteModel.type,
        'id': tvShowFavoriteModel.id,
        'title': tvShowFavoriteModel.title,
        'imagePath': tvShowFavoriteModel.imagePath,
      });

      return favoriteData;
    } catch (e) {
      rethrow;
    }
  }

  Stream<QuerySnapshot> readFavoriteData(String? type) {
    try {
      final Stream<QuerySnapshot> favoriteMovieStream = firebaseFirestore
          .collection('favorite_db')
          .doc(curentUser.currentUser!.email)
          .collection('favorite')
          .where('type', isEqualTo: type)
          .snapshots();

      return favoriteMovieStream;
    } catch (e) {
      rethrow;
    }
  }
}
