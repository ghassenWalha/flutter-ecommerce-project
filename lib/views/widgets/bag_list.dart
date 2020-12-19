import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/services/bag_service.dart';
import 'package:flutter_ecommerce_project/views/widgets/bag_item.dart';
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
  final bagService = BagService();
  List bagList ;
  /*This function removes a widget when we click on the  delete button*/
  void remove(id) {
    setState(() {
      bagService.deleteBagProduct(id);
    });
  }

/*This function adds 1 to the quantity when we click on the plus button
  void addQuantity(int id) {
    setState(() {
      list[id]['quantity'] = list[id]['quantity'] + 1;
    });
  }*/

/*This function substract 1 from the quantity when we click on the minus button*/
  void substractQuantity(int id) {}

/* Here we build the list */
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: Column(children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.725,
            child: FutureBuilder(
                future: bagService.getBag(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Product>> snapshot) {
                  if (snapshot.hasData) {
                    List<Product> products = snapshot.data;

                    print(products);

                      bagList = products
                        .map((Product product) => {"product": product, "quantity": 1})
                        .toList();
                    return ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, i) {
                          return BagItem(
                            product: bagList[i]["product"],
                            quantity: bagList[i]["quantity"],
                         key: ValueKey(bagList[i]["product"].name),
                            remove: remove,
                            addQuantity: () {
                              setState(() {
                                bagList[i]['quantity'] =
                                    bagList[i]['quantity'] + 1;
                              });
                            },
                            substractQuantity: () {
                              setState(() {
                                bagList[i]['quantity'] =
                                    bagList[i]['quantity'] - 1;
                              });
                            },
                          );
                        });
                  } else {
                    return Center(
                      child: Text('no data'),
                    );
                  }
                })),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            child: Total(
                bagList)) //This is the widget responsible for displaying the total
      ]),
    );
  }
}
