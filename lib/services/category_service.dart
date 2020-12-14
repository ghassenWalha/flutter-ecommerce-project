import 'dart:convert';
import 'package:flutter_ecommerce_project/models/category.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  final String CategoryUrl = "http://192.168.43.68:3001/api/categories";
  List<Category> categories = [];

  Future<List<Category>> getcategories() async {
    dynamic res = await http.get(CategoryUrl);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      Category cc = Category.fromJson(body[0]);
      print(body);
      print("------------------------------------------------------------");
      categories = body.map((dynamic item) => Category.fromJson(item)).toList();
      print(categories.length);
      return categories;
    } else {
      print("can't get categories");
    }
  }
}
