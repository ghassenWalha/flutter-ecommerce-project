import 'package:flutter/material.dart';

import './views/screens/my_home_page.dart';

import './views/screens/product_details_screen.dart';

import './views/screens/bag_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', initialRoute: '/', routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => MyHomePage(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/product_details_screen': (context) => ProductPage(),
    });
  }
}
