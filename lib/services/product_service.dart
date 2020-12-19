import 'dart:convert';

import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/product.dart';

class ProductService {
  final String ProductUrl = "http://192.168.43.68:3001/api/products";
  List<Product> products = [];

  Future<List<Product>> getProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    print(token);
    print("a");
    dynamic res = await http
        .get("$ProductUrl/adminpannel", headers: {"x-auth-token": token});
    print("C");
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      print(body);
      products = body.map((dynamic item) => Product.fromJson(item)).toList();
      /*products = [
        Product(
            name: "table",
            id: "3",
            category: "sofa",
            color: "green",
            description: "AAAAAA",
            price: 23,
            imgsUrl: ["aze"])
      ];*/
      print("aze");
      return products;
    } else {
      print("can't get products");
    }
  }

//Get Products By Category :
  Future<List<Product>> getProductsByCategory(String category) async {
    dynamic res = await get("$ProductUrl/bycategory/$category");
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      // Product pp = Product.fromJson(body[0]);
      //print(body);
      products = body.map((dynamic item) => Product.fromJson(item)).toList();
      //print(products.length);
      return products;
    } else {
      print("can't get products");
    }
  }

  Future<void> deleteProduct(String id) async {
    Response res = await delete("$ProductUrl/$id");
    if (res.statusCode == 200) {
      print("Deleted");
    }
  }
}
