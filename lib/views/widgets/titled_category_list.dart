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
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ))),
        Container(
            height: MediaQuery.of(context).size.height / 4,
            child: Expanded(child: CategoryList(categoryList)))
      ],
    );
  }
}
