import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import '../../services/product_service.dart';

// this widget is responsible for building the search item
class SearchItem extends SearchDelegate<Widget> {
  // building the list that contains the product names
  String query;
  List<String> namelist = List<String>();
  int i = 0;
  List<String> list() {
    // while (i < bagList.length) {
    // namelist.add(bagList[i]['name']);
    i++;
    //}
    return namelist;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    //this button is responsible for clearing the text in the search bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {
    final productService = new ProductService();
    List<Product> products;
    productService.searchProduct(query).then((value) => products = value);
    namelist = products == [] ? [] : products.map((e) => e.name).toList();

    // building the suggestion list
    return ListView.builder(
      itemCount: namelist.length,
      itemBuilder: (context, index) => ListTile(
          onTap: () {
            query = namelist[index];
            showResults(context);
          },
          title: Text(namelist[index])),
    );
  }
}
