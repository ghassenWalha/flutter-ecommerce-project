import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/views/widgets/admin_panel.dart';

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(children: [
          //SearchItem(),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(bottom: 0),
            child: AdminPanel(),
          )
        ]),
      ),
    );
  }
}
