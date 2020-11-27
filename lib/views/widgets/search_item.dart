import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/fixtures/fixture.dart';
//import 'package:flutter_ecommerce_project/views/widgets/admin_panel.dart';
import 'package:flutter_ecommerce_project/views/widgets/product_item_admin.dart';

class SearchItem extends SearchDelegate<Widget> {
  List<String> namelist = List<String>();
  int i = 0;
  List<String> list() {
    while (i < bagList.length) {
      namelist.add(bagList[i]['name']);
      i++;
    }
    return namelist;
  }

  List<Map<String, dynamic>> filtredList() {
    List<Map<String, dynamic>> widgetFilteredList = [
      {
        'name': 'zohra',
        'price': 300,
        'color': 'blue',
        'quantity': 2,
        //'imageUrl': 'zo',
      }
    ];

    int i;
    while (i < bagList.length) {
      if (query = bagList[i]['name']) {
        widgetFilteredList[i]['name'] = bagList[i]['name'];
        widgetFilteredList[i]['price'] = bagList[i]['price'];
        //widgetFilteredList[i]['imageUrl'] = bagList[i]['imageUrl'];
        widgetFilteredList[i]['color'] = bagList[i]['color'];
        widgetFilteredList[i]['quantity'] = bagList[i]['quantity'];
      }
      i++;
    }
    return widgetFilteredList;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
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
  Widget buildResults(BuildContext context) {
    /*return ListView.builder(
        itemCount: bagList.length,
        itemBuilder: (context, i) {
          return ProductItemAdmin(
            name: filtredList()[i]['name'],
            //  imageUrl: filtredList()[i]['imageUrl'],
            price: filtredList()[i]['price'],
            color: filtredList()[i]['color'],
            quantity: filtredList()[i]['quantity'],
            key: filtredList()[i]['name'],
            index: i,
            //remove: remove,
          );
        });*/
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = (query.isEmpty)
        ? list()
        : list().where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
          onTap: () {
            query = suggestionList[index];
            showResults(context);
          },
          //leading: Icon(Icons.location_city),
          title: Text(suggestionList[index])),
    );
  }
}
