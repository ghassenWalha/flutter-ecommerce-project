import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/views/widgets/product_list.dart';

/* this widget represent a titled and a scrollable list of products . it's formed by 
 column widget that contains a text widget and a ProductList widget 
  the constructor parameters are the title of the list and a list of products   _souheil  */

class TitledProductList extends StatelessWidget {
  final String title;
  final List<Product> productList;

  TitledProductList({this.title, this.productList});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        new Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ))),
        new Expanded(child: ProductList(productList))
      ],
    );
  }
}
