import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/category.dart';
import 'package:flutter_ecommerce_project/views/widgets/category_item.dart';
import 'package:flutter_ecommerce_project/views/widgets/category_list.dart';
import 'package:flutter_ecommerce_project/views/widgets/product_list.dart';

import 'package:flutter_ecommerce_project/views/widgets/product_view.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/views/widgets/product_grid_view.dart';
import 'package:flutter_ecommerce_project/views/widgets/titled_product_list.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    return TitledProductList(
      title: "Bestsellers",
      productList: [
        for (var i = 0; i < 10; i++)
          Product(
            id: 1,
            name: "sofa",
            description: "#######",
            price: "19.00",
            imgUrl:
                "https://www.manutan-collectivites.fr/media/catalog/product/cache/1/small_image/210x/9df78eab33525d08d6e5fb8d27136e95/C/h/Chaire_de_professeur,_plateau_beige-cf_4174455.jpg",
          ),
      ],
    );

    /*SafeArea(
      child: Center(
        child: ProductGridView(
          [
            for (var i = 0; i < 10; i++)
              Product(
                id: 1,
                name: "sofa",
                description: "#######",
                price: "19.00",
                imgUrl:
                    "https://www.manutan-collectivites.fr/media/catalog/product/cache/1/small_image/210x/9df78eab33525d08d6e5fb8d27136e95/C/h/Chaire_de_professeur,_plateau_beige-cf_4174455.jpg",
              ),
          ],
        ),
      ),
    );
    

     ListView(

        children: <Widget>[
          CategoryList([
            for (var i = 0; i < 10; i++)
              Category(
                  id: 1,
                  name: "sofa",
                  imageUrl:
                      "https://ii1.pepperfry.com/media/catalog/product/r/o/568x625/royal-wing-chair-in-blue-color-by-dreamzz-furniture-royal-wing-chair-in-blue-color-by-dreamzz-furnit-6hcjya.jpg")
          ]),

    */
  }
}
