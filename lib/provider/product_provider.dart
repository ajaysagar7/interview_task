import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  incrementCounter({required String quantityValue}) {
    var quantity = int.parse(quantityValue);
    quantity++;
    notifyListeners();
  }

  decrementProvider({required String quantityValue}) {
    var quantity = int.parse(quantityValue);
    quantity--;
    notifyListeners();
  }
}
