import 'package:flutter/material.dart';

class CartNotifier extends ChangeNotifier {
  List _ids = [];
  List _cart = [];

  List get ids => _ids;

  set ids(List newIds) {
    _ids = newIds;
    notifyListeners();
  }

  List<dynamic> get cart => _cart;

  set favorites(List newFav) {
    _cart = newFav;
    notifyListeners();
  }
}
