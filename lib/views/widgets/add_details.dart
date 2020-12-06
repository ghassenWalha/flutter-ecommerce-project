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
              labelText: 'Product Name',
            ),
            onSaved: null,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Price',
            ),
            onSaved: null,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Description',
            ),
            onSaved: null,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'More Info',
            ),
            onSaved: null,
          )
        ],
      ),
    );
  }
}
