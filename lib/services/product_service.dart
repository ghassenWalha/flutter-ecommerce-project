import 'dart:convert';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/product.dart';

class ProductService {
  final String productUrl = "http://192.168.43.68:3001/api/products";


  Future<List<Product>> getProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    dynamic res = await http
        .get("$productUrl/adminpannel", headers: {"x-auth-token": token});
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Product> products = body.map((dynamic item) => Product.fromJson(item)).toList();
      return products;
    } else {
      print("can't get products");
      return [];
    }
  }


  Future<void> addProduct(String name, String description, String moreInfo,
      double price, String category, List<String> imgUrls) async {
    var body = json.encode({
      "name": name,
      "description": description,
      "moreInfo": moreInfo,
      "price": price,
      "category": category,
      "imgUrls": imgUrls,
    });
    dynamic res = await post(productUrl, body: body);
    if (res.statusCode == 200) {
    print("product added");
    } else {
      print("can't add product");
    }
  }

  Future<void> updateProduct(String id, String name, String description,
      String moreInfo, double price, List<String> imgUrls) async {
    var body = json.encode({
      "name": name,
      "description": description,
      "moreInfo": moreInfo,
      "price": price,
      "imgUrls": imgUrls,
    });
    dynamic res = await put(productUrl, body: body);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      print(body);
    } else {
      print("can't update product");

    }
      }
//Get Products By Category :
  Future<List<Product>> getProductsByCategory(String category) async {
    dynamic res = await get("$productUrl/bycategory/$category");
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Product> products = body.map((dynamic item) => Product.fromJson(item)).toList();
      return products;
    } else {
      print("can't get products");
      return [];
    }
  }

  Future<void> deleteProduct(String id) async {
    Response res = await delete("$productUrl/$id");
    if (res.statusCode == 200) {
      print("Deleted");
    }
  }
}
