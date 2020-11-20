import 'package:flutter/material.dart';

class BagTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 70, bottom: 2),
        width: double.infinity,
        child: Text('My Bag', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
