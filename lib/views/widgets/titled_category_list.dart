import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/category.dart';
import 'package:flutter_ecommerce_project/views/widgets/category_list.dart';

/* this widget represent a titled and a scrollable list of categories . it's formed by 
 column widget that contains a text widget and a CategoryList widget 
  the constructor parameters are the title of the list and a list of categories   _souheil  */

class TitledCategoryList extends StatelessWidget {
  final String title;
  final List<Category> categoryList;

  TitledCategoryList({this.title, this.categoryList});
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
        new Expanded(
            child: CategoryList([
          for (var i = 0; i < 10; i++)
            Category(
              id: 1,
              name: "sofa",
              imageUrl:
                  "https://www.manutan-collectivites.fr/media/catalog/product/cache/1/small_image/210x/9df78eab33525d08d6e5fb8d27136e95/C/h/Chaire_de_professeur,_plateau_beige-cf_4174455.jpg",
            ),
        ]))
      ],
    );
  }
}
