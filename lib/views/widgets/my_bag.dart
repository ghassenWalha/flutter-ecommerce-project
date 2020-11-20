import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/views/widgets/button.dart';
//import 'package:flutter_ecommerce_project/views/widgets/product_info.dart';

// ignore: must_be_immutable
class MyBag extends StatelessWidget {
  String color;
  String name;
  double price;
  String imageUrl;
  int quantity;
  MyBag(name, imageUrl, price, color, quantity) {
    this.name = name;
    this.price = price;
    this.color = color;
    this.imageUrl = imageUrl;
    this.quantity = quantity;
  }

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
                      image: new AssetImage(imageUrl), fit: BoxFit.contain))),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          padding: EdgeInsets.only(left: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Text(name, style: TextStyle(fontSize: 16)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text('\$' + price.toString(), style: TextStyle(fontSize: 16)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.07),
            Text(color,
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
              IconButton(icon: Icon(Icons.delete), onPressed: null),
              SizedBox(height: MediaQuery.of(context).size.height * 0.07),
              Button(quantity),
            ],
          ),
        )
      ]),
    );
  }
}
