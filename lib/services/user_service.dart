import 'dart:developer';
import 'package:flutter_ecommerce_project/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  final String userUrl = "http://192.168.43.68:3002/api/users//api/auth";
  final String authUrl = "http://192.168.43.68:3002/api/auth";
  Future<List<User>> addUser(name, email, password) async {
    try {
      final response = await http.post(userUrl,
          headers: {"content-type": "application/json"},
          body: json
              .encode({"name": name, "email": email, "password": password}));
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<User> user = body.map((dynamic item) => User.fromJson(item));
        return user;
      } else {
        throw "can't get products";
      }
    } catch (e) {
      print(e);
    }
  }

  Future loginUser(email, password) async {
    try {
      final response = await http.post(authUrl,
          headers: {"content-type": "application/json"},
          body: json.encode({"email": email, "password": password}));

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<User> user = body.map((dynamic item) => User.fromJson(item));
        user.map((e) => print(e));
        return user;
      } else {
        throw "can't get products";
      }
    } catch (e) {
      print(e);
    }
  }
}
