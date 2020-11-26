import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';

import '../widgets/custom_action_bar.dart';
import '../widgets/image_swiper.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool _visible = false;
  String _moreInfoText = "MORE INFO ▼";

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
    final Product pp = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ListView(
              children: [
                ImageSwipe(pp.imgUrl),
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
                        pp.name,
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
                    "\$" + pp.price,
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
                    pp.description,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 3,
                    left: 24.0,
                    right: 24.0,
                  ),
                  child: GestureDetector(
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
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    right: 24.0,
                    bottom: 3,
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
                    for (var i = 3; i < 7; i++)
                      Container(
                        child: Image(
                          image: AssetImage(pp.imgUrl[i]),
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
                    fontWeight: FontWeight.w600,
                  ),
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
