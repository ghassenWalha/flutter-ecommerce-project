import 'package:flutter/material.dart';

class AddDetails extends StatefulWidget {
  @override
  _AddDetailsState createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView(
        children: [
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.local_mall_rounded),
              labelText: 'Product Name',
            ),
            onSaved: null,
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.attach_money_rounded),
              labelText: 'Price',
            ),
            onSaved: null,
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.description_rounded),
              labelText: 'Description',
            ),
            onSaved: null,
          ),
        ],
      ),
    );
  }
}
