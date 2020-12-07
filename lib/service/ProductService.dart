import 'dart:convert';

import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:http/http.dart';

 class ProductService {
  
final String ProductUrl="https://localhost:3002/api/products";
Future <List<Product>>getProducts() async{
Response res = await get(ProductUrl);
if (res.statusCode == 200){
List<dynamic> body = jsonDecode(res.body);
List<Product> products = body.map((dynamic item) => Product.fromJson(item)).toList();
return products ;
}
else{
  throw "can't get products";
}
}
}