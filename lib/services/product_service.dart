import 'dart:convert';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/product.dart';

class ProductService {
  final String productUrl = "https://ecommerce-node-junior.herokuapp.com/api/products/";


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


  Future<void> addProduct(Map product) async {
     product['price'] = product['price'].toString();
     product["imgsUrl"] = product["imgsUrl"].toString();

    dynamic res = await http.post(productUrl, headers: {"content-type": "application/json"}, body:  json
              .encode(product));
    if (res.statusCode == 200) {
    print("product added");
    } else {
      print("can't add product");
    }
  }

  Future<void> updateProduct(Map product) async {
         product['price'] = product['price'].toString();
     product["imgsUrl"] = product["imgsUrl"].toString();
  product["_id"] = product["id"];
  print(product);
    dynamic res = await http.put(productUrl, headers: {"content-type": "application/json"}, body:  json
              .encode(product));
    if (res.statusCode == 200) {
    dynamic body = jsonDecode(res.body);
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
    Response res = await http.delete("$productUrl/$id");
    if (res.statusCode == 200) {
      print("Deleted");
    }
  }
}
