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
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.22,
      margin: EdgeInsets.only(top: 2, bottom: 2),
      child: Row(children: [
        //The picture of the product
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          padding: EdgeInsets.only(left: 10),
          height: MediaQuery.of(context).size.height * 0.16,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image(
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width * 0.36,
                //height: MediaQuery.of(context).size.height * 0.4,
                image: new AssetImage(
                  widget.imageUrl,
                ),
              )),
        ),
        //Name,Price and the Color of the Product
        Container(
          width: MediaQuery.of(context).size.width * 0.32,
          padding: EdgeInsets.only(left: 16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(widget.name, style: TextStyle(fontSize: 16)),
                    Text('\$' + widget.price.toString(),
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
                Text('Color : ' + widget.color,
                    style: TextStyle(
                      color: Colors.grey,
                    )),
              ]),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.28,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //Delete Icon
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red[600],
                ),
                onPressed: () {
                  widget.remove(widget.index);
                },
              ),
              ItemCounter(widget.addQuantity, widget.quantity,
                  widget.substractQuantity), //ItemCounter
            ],
          ),
        )
      ]),
    );
  }
}
