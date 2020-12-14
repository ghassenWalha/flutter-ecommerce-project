import 'dart:convert';

import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/product.dart';

class ProductService {
  final String ProductUrl = "http://192.168.1.118:3001/api/products";
  List<Product> products = [];

  Future<List<Product>> getProducts() async {
    dynamic res = await http.get("$ProductUrl/adminpannel");

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      Product pp = Product.fromJson(body[0]);
      products = body.map((dynamic item) => Product.fromJson(item)).toList();

      print(products.length);
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

  Future<void> deleteProduct(int id) async {
    Response res = await delete("$ProductUrl/$id");
    if (res.statusCode == 200) {
      print("Deleted");
    }
  }
}
