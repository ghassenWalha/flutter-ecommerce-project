import 'dart:convert';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class FilterService {
  final String categoryUrl =
      "https://ecommerce-node-junior.herokuapp.com/api/products";

  Future<List<Product>> getProducts(String choice,String category) async {
    dynamic resultat;
    if(choice=="priceLowToHigh"){
   dynamic res = await http.get("$categoryUrl/?category=$category&price=1");
   resultat=res;
    }
    else if (choice=="priceHighToLow") {
 dynamic res = await http.get("$categoryUrl/?category=$category&price=-1");
 resultat=res;
    }
     else if (choice=="dateHighToLow") {
 dynamic res = await http.get("$categoryUrl/?category=$category&date=-1");
 resultat=res;
    }
     else  {
 dynamic res = await http.get("$categoryUrl/?category=$category&date=1");
 resultat=res;
    }
 if (resultat.statusCode == 200) {
      List<dynamic> body = jsonDecode(resultat.body);
      List<Product> products = body.map((dynamic item) => Product.fromJson(item)).toList();
      return products;
    } else {
      print("can't get products");
     
    }
  }
}