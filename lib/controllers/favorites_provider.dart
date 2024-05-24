import 'package:ecommerceapp/models/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoritesNotifier extends ChangeNotifier {
  final _favBox = Hive.box('fav_box');
  List _ids = [];
  List _favorites = [];

  List get ids => _ids;

  set ids(List newIds) {
    _ids = newIds;
    notifyListeners();
  }

  List<dynamic> get favorites => _favorites;

  set favorites(List newFav) {
    _favorites = newFav;
    notifyListeners();
  }

  getFavorites() {
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);
      return {
        "key": key,
        "id": item['id'],
      };
    }).toList();

    _favorites = favData.toList();
    _ids = favor.map((item) => item['id']).toList();
  }

  Future<void> createFav(Map<String, dynamic> addFav) async {
    await _favBox.add(addFav);
  }
}
