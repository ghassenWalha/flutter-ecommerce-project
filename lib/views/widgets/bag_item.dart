import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/views/widgets/item_counter.dart';

/*

This widget is responsible for creating the bag item 
_Zohra&Amal

*/
class BagItem extends StatefulWidget {
  final String color;
  final String name;
  final double price;
  final String imageUrl;
  final int quantity;
  final int index;
  final key;
  final Function remove;
  final Function addQuantity;
  final Function substractQuantity;
  BagItem({
    this.name,
    this.imageUrl,
    this.price,
    this.color,
    this.quantity,
    this.index,
    this.remove,
    this.key,
    this.addQuantity,
    this.substractQuantity,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BagItemState();
  }
}

class BagItemState extends State<BagItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.03,
          bottom: MediaQuery.of(context).size.width * 0.03),
      child: Row(children: [
        //The picture of the product
        Expanded(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                      image: new AssetImage(widget.imageUrl),
                      fit: BoxFit.contain))),
        ),
        //Name,Price and the Color of the Product
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          padding: EdgeInsets.only(left: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Text(widget.name, style: TextStyle(fontSize: 16)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text('\$' + widget.price.toString(),
                style: TextStyle(fontSize: 16)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.07),
            Text(widget.color,
                style: TextStyle(
                  color: Colors.grey,
                )),
          ]),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.28,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.035),
              //Delete Icon
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  widget.remove(widget.index);
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.07),
              ItemCounter(widget.addQuantity, widget.quantity,
                  widget.substractQuantity), //ItemCounter
            ],
          ),
        )
      ]),
    );
  }
}
