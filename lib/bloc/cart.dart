import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/models/Model.dart';

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];
  final int unitPrice = 10;

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  void addItem(int id, Item item) {
    _items.add(item);
    notifyListeners();
  }

   void clearItem() {
    _items.clear();
    notifyListeners();
  }

  int quantity(int id) {
    return _items[id].quantity;
  }

  int get totalPrice {
    int total = 0;
    for (int i = 0; i < _items.length; i++) {
      total += _items[i].quantity * unitPrice;
    }
    return total;
  }
}
