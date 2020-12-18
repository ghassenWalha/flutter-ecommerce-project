import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/category.dart';
import 'package:flutter_ecommerce_project/models/product.dart';

class AddDetails extends StatefulWidget {
  Map product;
  bool update;
  Function changedAtrribut;

  AddDetails({this.product, this.changedAtrribut, this.update});

  @override
  _AddDetailsState createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final moreInfoController = TextEditingController();
  final priceController = TextEditingController();
  String category;

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.product["name"];
    descriptionController.text = widget.product["description"];
    moreInfoController.text = widget.product["moreInfo"];
    priceController.text = widget.product["price"].toString();
    return Container(
      height: 250,
      child: ListView(
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Product Name',
            ),
            onSaved: null,
            onChanged: (value) => widget.changedAtrribut("name", value),
          ),
          TextFormField(
            controller: priceController,
            decoration: InputDecoration(
              labelText: 'Price',
            ),
            onSaved: null,
            onChanged: (value) => widget.changedAtrribut("price", value),
          ),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
              labelText: 'Description',
            ),
            onSaved: null,
            onChanged: (value) => widget.changedAtrribut("description", value),
          ),
          TextFormField(
            controller: moreInfoController,
            decoration: InputDecoration(
              labelText: 'More Info',
            ),
            onSaved: null,
            onChanged: (value) => widget.changedAtrribut("moreInfo", value),
          ),
          Visibility(
            visible: !widget.update,
            child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Category',
                ),
                onSaved: null,
                onChanged: (value) {
                  widget.changedAtrribut("category", value);
                }),
          ),
        ],
      ),
    );
  }
}
