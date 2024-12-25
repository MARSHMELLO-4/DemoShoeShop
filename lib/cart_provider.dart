import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String,dynamic>> cart = []; //this will be the list of the items that are being added to the cart

  void addProduct(Map<String,dynamic> product) {
    cart.add(product);
    notifyListeners();//this is how we are going to add the product in the cart wheneever a product is added to it
  }

  void removeProduct (Map<String,dynamic> product) {
    /*remove the product from the list ie from the cart*/
    cart.remove(product);
    notifyListeners();
  }
/*notifylisteners is used to render the page again so that we dont have to hot reload everytime*/
}