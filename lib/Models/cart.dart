import 'package:store/Models/product.dart';

class Cart {
  String id;
  int qty;
  int supPrice;
  Product product;
  Cart(
      {required this.id,
      required this.qty,
      required this.supPrice,
      required this.product});
  @override
  String toString() {
    // TODO: implement toString
    return "${product.name}   ${product.price}";
  }
}
