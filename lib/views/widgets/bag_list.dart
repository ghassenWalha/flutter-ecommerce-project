import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/views/widgets/bag_item.dart';
import 'package:flutter_ecommerce_project/fixtures/fixture.dart';
import 'package:flutter_ecommerce_project/views/widgets/total.dart';

/*
This class displays the list of Bag items

_Zohra&Amal
*/
class BagList extends StatefulWidget {
  @override
  BagListState createState() => BagListState();
}

class BagListState extends State<BagList> {
  final list = bagList;
  /*This function removes a widget when we click on the  delete button*/
  void remove(id) {
    setState(() {
      list.removeAt(id);
    });
  }

/*This function adds 1 to the quantity when we click on the plus button*/
  void addQuantity(int id) {
    setState(() {
      list[id]['quantity'] = list[id]['quantity'] + 1;
    });
  }

/*This function substract 1 from the quantity when we click on the minus button*/
  void substractQuantity(int id) {
    setState(() {
      list[id]['quantity'] = list[id]['quantity'] - 1;
    });
  }

/* Here we build the list */
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.73,
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i) {
                return BagItem(
                  name: list[i]['name'],
                  imageUrl: list[i]['imageUrl'],
                  price: list[i]['price'],
                  color: list[i]['color'],
                  quantity: list[i]['quantity'],
                  key: ValueKey(list[i]['name']),
                  index: i,
                  remove: remove,
                  addQuantity: () {
                    addQuantity(i);
                  },
                  substractQuantity: () {
                    substractQuantity(i);
                  },
                );
              }),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            child: Total(
                list)) //This is the widget responsible for displaying the total
      ]),
    );
  }
}
