import 'package:flutter/material.dart';
import 'Category_Item.dart';

/* this widget present a scrolable horizontal list of the category Items .
   it takes a map of that contains each category title and image path . you can add a new 
   category after instantiation with add category  _ souheil  */

class CategoryList extends StatelessWidget {
  final List<Widget> widgetsList = [];

  // this is a constructor  that takes a map of categories and creat a list of category_item widgets

  CategoryList(Map<String, String> m1) {
    m1.forEach((key, value) {
      widgetsList.add(CategoryItem(
        title: key,
        path: value,
      ));
    });
  }

  // this function a new category to the list
  void addCategory(String title, String path) {
    widgetsList.add(CategoryItem(
      title: title,
      path: path,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
            scrollDirection: Axis.horizontal, children: this.widgetsList));
  }
}
