import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/views/widgets/product_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductGridView extends StatelessWidget {
  final List<Product> productList;

  /// final List<ProductView> productListView = [];

  ProductGridView(this.productList);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: productList.length,
          itemBuilder: (BuildContext context, int index) =>
              ProductView(productList[index]),
          staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 20,
          padding: EdgeInsets.all(10),
        )

        /*GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 7,
          crossAxisSpacing: 7,
          children: [
            ...productList.map((produit) => ProductView(produit)).toList()
          ],
        )*/
        );
  }
}
