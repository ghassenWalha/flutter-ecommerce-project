import 'package:flutter/material.dart';
import 'Category_Item.dart';

class CategoryList extends StatefulWidget {
  final Map<String, String> items;

  CategoryList({this.items});
  @override
  _CategoryListState createState() => _CategoryListState(items);
}

class _CategoryListState extends State<CategoryList> {
  final List<Widget> widgetsList = [];

  // this is a constructor  that takes a map of categories and creat a list of category_item widgets

  _CategoryListState(Map<String, String> m1) {
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
        child:
            ListView(scrollDirection: Axis.horizontal, children: widgetsList));
  }
}
