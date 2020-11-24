import 'package:flutter/material.dart';

/*

This widget is responsible for creating the Product item for the admin
_Zohra&Amal

*/
class ProductItemAdmin extends StatefulWidget {
  final String color;
  final String name;
  final double price;
  final String imageUrl;
  final int quantity;
  final int index;
  final key;
  final Function remove;

  ProductItemAdmin({
    this.name,
    this.imageUrl,
    this.price,
    this.color,
    this.quantity,
    this.index,
    this.remove,
    this.key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProductItemAdminState();
  }
}

class ProductItemAdminState extends State<ProductItemAdmin> {
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
          child: Row(
            children: [
              IconButton(icon: Icon(Icons.edit), onPressed: null),
              //Delete Icon
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  widget.remove(widget.index);
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
