import 'dart:convert';

import 'package:dio/dio.dart';
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
