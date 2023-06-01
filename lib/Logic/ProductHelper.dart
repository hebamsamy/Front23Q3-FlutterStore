import 'package:dio/dio.dart';
import 'package:store/Models/product.dart';

class ProductApiHelper {
  var api = Dio();
  getone(String id) {}
  Future<List<Product>> getAll() async {
    List<Product> productlist = [];

    var responce = await api.get("http://192.168.56.1:5000/product/");
    var data = responce.data["data"] as List;

    print(data);
    productlist = data
        .map((e) => Product(
            id: e["_id"],
            name: e["name"],
            price: e["price"] as int,
            quantity: e["quantity"] as int,
            categoryID: e["categoryID"],
            description: e["description"] ?? "test",
            colors: ["hjgzh"],
            imgURL: e["imgURL"] ?? "",
            status: e["status"] ?? ""))
        .toList();
    return productlist;
  }
}
