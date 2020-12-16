import 'dart:developer';
import 'package:flutter_ecommerce_project/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final String userUrl = "http://192.168.43.68:3001/api/users/";
  final String authUrl = "http://192.168.43.68:3001/api/auth/";

  Future<User> addUser(name, email, password) async {
    try {
      final response = await http.post(userUrl,
          headers: {"content-type": "application/json"},
          body: json
              .encode({"name": name, "email": email, "password": password}));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        User user = User(
            name: body["name"],
            isAdmin: body["isAdmin"],
            token: response.headers["x-auth-token"],
            bag: body["bag"],
            email: body["email"],
            favorite: body["favorite"]);

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("token", user.token);
        prefs.setString("email", user.email);
        prefs.setString("username", user.name);

        return user;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<User> loginUser(email, password) async {
    try {
      final response = await http.post(authUrl,
          headers: {"content-type": "application/json"},
          body: json.encode({"email": email, "password": password}));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        User user = User(
            name: body["name"],
            isAdmin: body["isAdmin"],
            token: response.headers["x-auth-token"],
            bag: body["bag"],
            email: body["email"],
            favorite: body["favorite"]);

        /* final SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString("token", response.headers["x-auth-token"]);
        prefs.setString("email", user.email);
        prefs.setString("username", user.name);
        return user;*/
      } else {
        throw response.body;
      }
    } catch (e) {
      print(e);
    }
  }
}
