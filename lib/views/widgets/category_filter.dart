import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/views/widgets/product_grid_view.dart';

import 'custom_action_bar.dart';

class CategoryFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String category = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: Column(
      children: [
        Row(children: [
          CustomActionBar(
            hasBackArrrow: true,
            hasTitle: true,
            hasBackground: false,
            hasFavoriteIcon: false,
          ),
          Text(
            category,
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          )
        ]),
        Flexible(
            child: ProductGridView(
          [
            for (var i = 1; i < 7; i++)
              Product(
                  id: i,
                  name: "sofa",
                  description: "#######",
                  category: "sofa",
                  price: "19.00",
                  imgUrl: [
                    "assets/images/$i.jpg",
                    "assets/images/$i.jpg",
                    "assets/images/$i.jpg",
                    "assets/images/$i.jpg",
                    "assets/images/$i.jpg",
                    "assets/images/$i.jpg",
                    "assets/images/$i.jpg",
                    "assets/images/$i.jpg",
                    "assets/images/$i.jpg",
                    "assets/images/$i.jpg",
                    "assets/images/$i.jpg",
                    "assets/images/$i.jpg",
                    "assets/images/$i.jpg",
                  ]),
          ],
        ))
      ],
    ));
  }
}
