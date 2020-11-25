import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/views/widgets/product_item_admin.dart';

import 'package:flutter_ecommerce_project/fixtures/fixture.dart';

/*
This class displays the list of Products for the administrator
_Zohra&Amal
*/
class AdminPanel extends StatefulWidget {
  @override
  AdminPanelState createState() => AdminPanelState();
}

class AdminPanelState extends State<AdminPanel> {
  final list = bagList;
  /*This function removes a widget when we click on the  delete button*/
  void remove(id) {
    setState(() {
      list.removeAt(id);
    });
  }

/* Here we build the list */
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i) {
                return ProductItemAdmin(
                  name: list[i]['name'],
                  imageUrl: list[i]['imageUrl'],
                  price: list[i]['price'],
                  color: list[i]['color'],
                  quantity: list[i]['quantity'],
                  key: ValueKey(list[i]['name']),
                  index: i,
                  remove: remove,
                );
              }),
        )
      ]),
    );
  }
}
