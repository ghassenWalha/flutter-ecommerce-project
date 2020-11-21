import 'package:flutter/material.dart';
//import 'package:flutter_ecommerce_project/views/widgets/bag_list_view.dart';
import 'package:flutter_ecommerce_project/views/widgets/button.dart';

//import 'bag_list.dart';
//import 'package:flutter_ecommerce_project/views/widgets/product_info.dart';

// ignore: must_be_immutable
class MyBag extends StatefulWidget {
  final String color;
  final String name;
  final double price;
  final String imageUrl;
  final int quantity;
  final int index;
  final key;
  final Function remove;
  final Function addQuantity;
  MyBag({
    this.name,
    this.imageUrl,
    this.price,
    this.color,
    this.quantity,
    this.index,
    this.remove,
    this.key,
    this.addQuantity,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyBagState();
  }
}

class MyBagState extends State<MyBag> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.03,
          bottom: MediaQuery.of(context).size.width * 0.03),
      child: Row(children: [
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
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  /*setState(() {*/
                  widget.remove(widget.index);
                } /*);*/,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              ButtonItem(widget.addQuantity, widget.quantity),
            ],
          ),
        )
      ]),
    );
  }
}
