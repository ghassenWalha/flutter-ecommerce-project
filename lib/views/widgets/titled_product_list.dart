import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/views/widgets/product_list.dart';

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
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ))),
        new Expanded(
            child: ProductList([
          for (var i = 0; i < 10; i++)
            Product(
              id: 1,
              name: "sofa",
              description: "#######",
              price: "19.00",
              imgUrl:
                  "https://www.manutan-collectivites.fr/media/catalog/product/cache/1/small_image/210x/9df78eab33525d08d6e5fb8d27136e95/C/h/Chaire_de_professeur,_plateau_beige-cf_4174455.jpg",
            ),
        ]))
      ],
    );
  }
}
