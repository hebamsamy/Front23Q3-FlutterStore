import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:store/Models/product.dart';
import 'package:store/Models/user.dart';

class AuthApiHelper {
  var api = Dio();

  Future<dynamic> register(User user) async {
    print(user);
    var data = jsonEncode({
      "name": user.name,
      "password": user.password,
      "phoneNumber": user.phoneNumber,
      "email": user.email,
    });
    var responce =
        await api.post("http://10.171.240.62:5000/user/register", data: data);
    print(responce.data);
    return responce.data;
  }

  Future<dynamic> AddProduct(
      Product product, String filepath, String filename) async {
    final formData = FormData.fromMap({
      "name": product.name,
      "price": product.price,
      "quantity": product.quantity,
      "description": product.description,
      "categoryID": product.categoryID,
      "colors": product.colors,
      'imgURL': await MultipartFile.fromFile(filepath, filename: filename),
    });

    var responce =
        await api.post("http://192.168.56.1:5000/product/add", data: formData);
    print(responce.data);
    return responce.data;
  }

  Future<dynamic> login(User user) async {
    print(user);
    var data = jsonEncode({
      "password": user.password,
      "email": user.email,
    });
    var responce =
        await api.post("http://10.171.240.62:5000/user/login", data: data);
    print(responce.data);
    return responce.data;
  }
}
