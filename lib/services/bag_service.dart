import 'dart:developer';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class BagService {
  final String BagUrl = "http://192.168.43.68:3001/api/bag";
  List<Product> bag = [];

  Future<List<Product>> getBag() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");

    dynamic res = await http.get("$BagUrl", headers: {"x-auth-token": token});

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      bag = body.map((dynamic item) => Product.fromJson(item)).toList();
      print(bag.length);

      return bag;
    } else {
      print("can't get bag");
    }
  }

  Future<void> deleteBagProduct(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    Response res =
        await delete("$BagUrl/$id", headers: {'x-auth-token': token});
    if (res.statusCode == 200) {
      print("Deleted");
    }
  }
}
