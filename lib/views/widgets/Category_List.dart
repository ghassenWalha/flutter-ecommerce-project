import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/category.dart';
import 'category_item.dart';

/* this widget present a scrolable horizontal list of the category Items .
   it takes of Category objects and display them in a list   using CategoryItem widget.
    you can add a new category after instantiation with add category methode  _ souheil  */

class CategoryList extends StatelessWidget {
  final List<Widget> widgetsList = [];

  // this is a constructor  that takes a List categories and creat a list of category_item widgets

  CategoryList(List<Category> m1) {
    m1.forEach((element) {
      widgetsList.add(CategoryItem(element));
    });
  }

  // this function add a new category to the list
  void addCategory(Category c1) {
    widgetsList.add(CategoryItem(c1));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 5,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: this.widgetsList,
          itemExtent: MediaQuery.of(context).size.width / 4,
        ));
  }
}
