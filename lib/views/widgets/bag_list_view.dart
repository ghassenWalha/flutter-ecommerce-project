import 'package:flutter/material.dart';
//import 'package:flutter_ecommerce_project/views/widgets/button.dart';
import 'package:flutter_ecommerce_project/views/widgets/my_bag.dart';
import 'package:flutter_ecommerce_project/fixtures/fixture.dart';

class BagListView extends StatefulWidget {
  @override
  BagListViewState createState() => BagListViewState();
}

class BagListViewState extends State<BagListView> {
  var list = bagList;
  void remove(id) {
    setState(() {
      list.removeAt(id);
    });
  }

  void addQuantity(int id) {
    setState(() {
      list[id]['quantity'] = list[id]['quantity'] + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return ListView.builder(
        itemCount: list.length,
        // Nombre d'élément dans votre liste de données (ici data)
        itemBuilder: (context, i) {
          // Construction du widget à répéter

          return MyBag(
              name: list[i]['name'],
              imageUrl: list[i]['imageUrl'],
              price: list[i]['price'],
              color: list[i]['color'],
              //quantity: list[i]['quantity'],
              key: ValueKey(list[i]['name']),
              index: i,
              remove: remove,
              addQuantity: () {
                addQuantity(i);
                print('list[i][quantity]');
                print(list[i]['quantity']);
              });
        });
  }
}
