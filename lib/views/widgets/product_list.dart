import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'product_view.dart';

/* this widget present a scrolable horizontal list of products .
   it takes a list of productsof and you can add a new 
   Product after instantiation with add category  _ souheil  */

class ProductList extends StatelessWidget {
  final List<Widget> widgetsList = [];

  // this is a constructor  that takes a list of products and creat a list of product_view widgets

  ProductList(List<Product> m1) {
    m1.forEach((element) {
      widgetsList.add(ProductView(element));
    });
  }

  // this function add a new product to the list
  void addProduct(Product c1) {
    widgetsList.add(ProductView(c1));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: 430,
        child: ListView(
          scrollDirection: Axis.horizontal,
          itemExtent: MediaQuery.of(context).size.width / 2,
          children: this.widgetsList,
        ));
  }
}
