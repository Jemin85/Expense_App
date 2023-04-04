import 'package:expense_tracker/model/favModel.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  List<ItemModel> lst = <ItemModel>[];

  add(ItemModel) {
    lst.add(ItemModel());
    notifyListeners();
  }

  del(int index) {
    lst.removeAt(index);
    notifyListeners();
  }
}
