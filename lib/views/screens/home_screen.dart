import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/views/widgets/Category_Items.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CategoryItem(
            title: "Sofa",
            path:
                "https://www.ikea.com/us/en/images/products/morabo-sofa-gunnared-dark-gray-metal__0602115_PE680184_S5.JPG",
          )
        ],
      ),
    );
  }
}
