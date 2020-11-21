import 'package:flutter/material.dart';
//import 'package:flutter_ecommerce_project/views/widgets/button.dart';
import 'package:flutter_ecommerce_project/views/widgets/my_bag.dart';
import 'bag_list.dart';

class BagListView extends StatefulWidget {
  //VoidCallback adQuantity;
  //BagListView(this.adQuantity);

  @override
  BagListViewState createState() => BagListViewState();
}

class BagListViewState extends State<BagListView> {
  int addQuantity(int index, int q) {
    return q++;
  }

  /*VoidCallback adQuantity;
  BagListViewState(addQuantity) {
    this.adQuantity = addQuantity;
  }*/

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return ListView.builder(
        itemCount: BagList.bagList.length,
        // Nombre d'élément dans votre liste de données (ici data)
        itemBuilder: (context, i) {
          // Construction du widget à répéter

          return MyBag(
              name: BagList.bagList[i]['name'],
              imageUrl: BagList.bagList[i]['imageUrl'],
              price: BagList.bagList[i]['price'],
              color: BagList.bagList[i]['color'],
              //quantity: BagList.bagList[i]['quantity'],
              key: ValueKey(BagList.bagList[i]['name']),
              removeUser: () {
                setState(() {
                  BagList.bagList.removeAt(i);
                });
              },
              addQuantity: () {
                setState(() {
                  addQuantity(i, BagList.bagList[i]['quantity']);
                });
              });
        });
  }
}
