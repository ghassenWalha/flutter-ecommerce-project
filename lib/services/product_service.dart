import 'dart:convert';

import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:http/http.dart';

class ProductService {
  final String ProductUrl = "http://192.168.1.6:3002/api/products";
  List<Product> products = [];

  Future<List<Product>> getProducts() async {
    dynamic res = await get(ProductUrl);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      Product pp = Product.fromJson(body[0]);
      print(body);
      products = body.map((dynamic item) => Product.fromJson(item)).toList();
      print(products.length);
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
