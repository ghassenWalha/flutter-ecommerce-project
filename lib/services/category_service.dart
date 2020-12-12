import 'dart:convert';

import 'package:flutter_ecommerce_project/models/category.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:http/http.dart';

class CategoryService {
  final String CategoryUrl = "http://localhost:3002/api/categories";
  List<Category> categories = [];

  Future<List<Category>> getcategories() async {
    dynamic res = await get(CategoryUrl);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      Category cc = Category.fromJson(body[0]);
      print(body);
      categories = body.map((dynamic item) => Category.fromJson(item)).toList();
      print(categories.length);
      return categories;
    } else {
      print("can't get categories");
    }
  }
}