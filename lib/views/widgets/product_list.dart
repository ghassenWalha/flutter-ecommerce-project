import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/views/widgets/Product_View.dart';

/* this widget present a scrolable horizontal list of products .
   it takes a list of productsof and you can add a new 
   Product after instantiation with add category  _ souheil  */

class ProductList extends StatelessWidget {
  final List<Product> productList;

  // this is a constructor  that takes a list of products and creat a list of product_view widgets

  ProductList(this.productList);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: (MediaQuery.of(context).size.height / 4) * 1.3,
        child: ListView.builder(
          itemCount: productList.length,
          scrollDirection: Axis.horizontal,
          itemExtent: MediaQuery.of(context).size.width / 2,
          itemBuilder: (BuildContext ctxt, int index) {
            return ProductView(productList[index]);
          },
        ));
  }
}
