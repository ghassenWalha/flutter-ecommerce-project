import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/category.dart';

class AddDetails extends StatefulWidget {
  String productName = '';
  double price = 0.0;
  String description = '';
  String moreInfo = '';
  bool update;
  Function changedAtrribut;

  AddDetails(
      {this.description,
      this.moreInfo,
      this.price,
      this.productName,
      this.changedAtrribut,
      this.update});

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
    nameController.text = widget.productName;
    descriptionController.text = widget.description;
    moreInfoController.text = widget.moreInfo;
    priceController.text = widget.price.toString();
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
            onChanged: (value) => widget.changedAtrribut(
              value,
              widget.description,
              widget.price,
              widget.moreInfo,
              category,
            ),
          ),
          TextFormField(
            controller: priceController,
            decoration: InputDecoration(
              labelText: 'Price',
            ),
            onSaved: null,
            onChanged: (value) => widget.changedAtrribut(
              widget.productName,
              widget.description,
              value,
              widget.moreInfo,
              category,
            ),
          ),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
              labelText: 'Description',
            ),
            onSaved: null,
            onChanged: (value) => widget.changedAtrribut(
              widget.productName,
              value,
              widget.price,
              widget.moreInfo,
              category,
            ),
          ),
          TextFormField(
            controller: moreInfoController,
            decoration: InputDecoration(
              labelText: 'More Info',
            ),
            onSaved: null,
            onChanged: (value) => widget.changedAtrribut(
              widget.productName,
              widget.description,
              widget.price,
              value,
              category,
            ),
          ),
          Visibility(
            visible: !widget.update,
            child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Category',
                ),
                onSaved: null,
                onChanged: (value) {
                  category = value;
                  widget.changedAtrribut(
                    widget.productName,
                    widget.description,
                    widget.price,
                    widget.moreInfo,
                    value,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
