import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/category.dart';
import 'package:flutter_ecommerce_project/views/widgets/category_item.dart';
import 'package:flutter_ecommerce_project/views/widgets/category_list.dart';
import 'package:flutter_ecommerce_project/views/widgets/product_list.dart';

import 'package:flutter_ecommerce_project/views/widgets/product_view.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/views/widgets/product_grid_view.dart';
import 'package:flutter_ecommerce_project/views/widgets/titled_category_list.dart';
import 'package:flutter_ecommerce_project/views/widgets/titled_product_list.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: <Widget>[
      Expanded(
          child: TitledCategoryList(title: "Categories", categoryList: [
        for (var i = 0; i < 10; i++)
          Category(
              id: 1,
              name: "table",
              imageUrl:
                  "https://cdn3.hellin.fr/13839-zoom_default/table-a-manger-rectangulaire-en-bois-pieds-metal-jonas.jpg"),
      ]))
    ]));
  }
}
/*
    
    ,
        new Expanded(
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
        )),
    
    
     */
