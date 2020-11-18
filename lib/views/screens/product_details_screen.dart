import 'package:flutter/material.dart';

import '../widgets/custom_action_bar.dart';
import '../widgets/image_swiper.dart';
import '../widgets/Button.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int moreInfoState = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            //padding: EdgeInsets.all(0),
            children: [
              ImageSwipe(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 24.0,
                  left: 24.0,
                  right: 24.0,
                  bottom: 4.0,
                ),
                child: Row(
                  children: [
                    Text(
                      "Product Name",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left:
                              115), // the paading neeed to change because it's not always practical
                      child: Button(),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 24.0,
                ),
                child: Text(
                  "\$89.00",
                  style: TextStyle(
                    color: Colors.red[800],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 24.0,
                ),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce porta turpis quis purus consequat, id placerat enim iaculis.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 24.0,
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      "MORE INFO",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      width: 30,
                      height: 25,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: RaisedButton(
                        color: Colors.grey,
                        onPressed: null,
                        child: Text(
                          "▼",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Expanded(
                  child: Container(
                    height: 65.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Add To Cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
          CustomActionBar(
            hasBackArrrow: true,
            hasTitle: false,
            hasBackground: false,
          )
        ],
      ),
    );
  }
}
