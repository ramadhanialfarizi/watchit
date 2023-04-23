import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/cloud_firestore_helper.dart';

class FavoriteProvider extends ChangeNotifier {
  final CloudFireStoreHelper cloudFireStoreHelper = CloudFireStoreHelper();

  Stream<QuerySnapshot> getFavoriteData(String? type) {
    return cloudFireStoreHelper.readFavoriteData(type);
  }
}
