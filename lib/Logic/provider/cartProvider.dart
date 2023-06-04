import 'package:flutter/material.dart';
import 'package:store/Models/product.dart';

import '../../Models/cart.dart';

class CartProvider extends ChangeNotifier {
  List<Cart> cartList = [];

  int get count {
    return cartList.length;
  }

//total
  int get total {
    int temp = 0;
    cartList.forEach((cart) {
      temp += cart.supPrice;
    });
    return temp;
  }

  //add
  void add(Product prd) {
    if (cartList.where((item) => item.product.id == prd.id).length == 0) {
      //cant find product so push()
      cartList.add(Cart(id: prd.id, qty: 1, supPrice: prd.price, product: prd));
    }

    notifyListeners();
  }

  //remove
  void remove(Cart cart) {
    cartList.remove(cart);
    notifyListeners();
  }

  //undo
  void undo(Cart cart) {
    cartList.add(cart);
    notifyListeners();
  }

  //emtpy
  void empty() {
    cartList = [];
    notifyListeners();
  }

  //incement (new Qty,product)
  void incement(Product prd) {
    cartList.forEach((cart) {
      if (cart.product.id == prd.id) {
        cart.qty = cart.qty + 1;

        cart.supPrice = cart.qty * cart.product.price;

        ///to do update product qty i back end
        ///
      }
    });
    notifyListeners();
  }

  //decement (new Qty,product)
  void decement(Product prd) {
    cartList.forEach((cart) {
      if (cart.product.id == prd.id) {
        if (cart.qty != 1) {
          cart.qty = cart.qty - 1;

          cart.supPrice = cart.qty * cart.product.price;
        }
      }
    });
    notifyListeners();
  }
}
