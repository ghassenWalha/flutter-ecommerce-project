import 'package:flutter/material.dart';

import '../widgets/custom_action_bar.dart';
import '../widgets/image_swiper.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool _visible = false;
  String _moreInfoText = "MORE INFO ▼";

  @override
  void moreInfo() {
    setState(() {
      _visible = !_visible;
    });
    if (_visible == true) {
      setState(() {
        _moreInfoText = "LESS INFO ▲";
      });
    } else {
      setState(() {
        _moreInfoText = "MORE INFO ▼";
      });
    }
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
                      Align(
                        alignment: Alignment.bottomRight,
                        // child: RaisedButton(),
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
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 24.0,
                    right: 24.0,
                    bottom: 1,
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
                    vertical: 8.0,
                    horizontal: 24.0,
                  ),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: moreInfo,
                        child: Container(
                            width: 100.0,
                            height: 42.0,
                            //alignment: Alignment.topLeft,
                            child: Text(
                              _moreInfoText,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 1,
                          horizontal: 1,
                        ),
                        child: Visibility(
                          visible: _visible,
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce porta turpis quis purus consequat, id placerat enim iaculis.",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 0,
                    left: 24,
                    right: 24,
                    bottom: 6,
                  ),
                  child: Text(
                    "YOU MIGHT ALSO LIKE :",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Container(
                  height: 400.0,
                  child: PageView(children: [
                    for (var i = 5; i < 8; i++)
                      Container(
                        child: Image(
                          image: AssetImage("images/$i.jpg"),
                          fit: BoxFit.cover,
                          width: 200,
                          height: 250,
                        ),
                      ),
                  ]),
                ),
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
