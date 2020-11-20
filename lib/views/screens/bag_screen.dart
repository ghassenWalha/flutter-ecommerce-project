import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/views/widgets/bag_title.dart';
import '../widgets/bag_list.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //appBar: AppBar(title: Text('Flutter App')),
      body: Column(children: [
        BagTitle(),
        Container(
          color: Colors.white,
          width: double.infinity,
          height: 550,
          padding: EdgeInsets.only(bottom: 0),
          child: BagList(),
        )
      ]),
    );
  }
}
