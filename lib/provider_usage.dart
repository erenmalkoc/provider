import 'package:flutter/cupertino.dart';

import 'item.dart';

class ProviderUsage extends ChangeNotifier {
  List<Item> items = [
    Item(name: 'SmartPhone', id: 01, isGood: true),
    Item(name: 'PersonalComputer', id: 02, isGood: false),
  ];

  void addItem(Item item) {
    items.add(item);
    notifyListeners();
  }



  void removeItem(Item item) {
    items.remove(item);
    notifyListeners();
  }
}
