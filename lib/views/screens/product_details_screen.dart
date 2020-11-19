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
  Widget moreInfo(moreInfoState) {
    if (moreInfoState != 0) {
      moreInfoState = 0;
      return Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce porta turpis quis purus consequat, id placerat enim iaculis.",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 13,
        ),
      );
    } else
      return null;
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      /*Container(
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
                      ),*/
                      GestureDetector(
                        onTap: null,
                        child: Container(
                            width: 100.0,
                            height: 42.0,
                            //alignment: Alignment.topLeft,
                            child: Text(
                              "MORE INFO ▼",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24,
                    left: 24,
                    right: 24,
                    bottom: 74,
                  ),
                  child: Text(
                    "YOU MIGHT ALSO LIKE",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                //Padding(),
                /* Padding(
                  padding: const EdgeInsets.only(
                    bottom: 24.0,
                    left: 24.0,
                    right: 24.0,
                  ),
                  child: Expanded(
                    child: Container(
                      height: 65.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Add To Bag",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),*/
              ],
            ),
            CustomActionBar(
              hasBackArrrow: true,
              hasTitle: false,
              hasBackground: false,
            )
          ],
        ),
        floatingActionButton: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 24.0,
            ),
            child: FloatingActionButton(
              onPressed: null,
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
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
