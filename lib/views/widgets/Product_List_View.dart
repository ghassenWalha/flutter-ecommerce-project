import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/views/widgets/Product_View.dart';

class ProductListView extends StatelessWidget {
  final List<Product> productList;
  final List<ProductView> productListView = [];
  ProductListView({this.productList}) {
    productList.forEach((element) {
      productListView.add(ProductView(product: element));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 7,
          crossAxisSpacing: 7,
          children: productListView),
    );
  }
}
