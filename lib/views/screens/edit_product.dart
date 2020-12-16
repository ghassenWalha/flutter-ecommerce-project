import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/views/widgets/product_item_admin.dart';
//import 'package:flutter_ecommerce_project/models/product.dart';

import '../widgets/add_image.dart';
import '../widgets/add_details.dart';
import '../widgets/customized_button.dart';
import '../../services/product_service.dart';

import '../widgets/add_image.dart';
import '../widgets/add_details.dart';

class EditProduct extends StatefulWidget {
  ProductService productService = new ProductService();
   String id;
 String color;
 String name;
 double price;
 String category;
 String description;
 String moreInfo;
 List<String> imageUrl;
  bool update = false;
  final key;

  EditProduct({
    this.id,
    this.category,
    this.description,
    this.update,
    this.moreInfo,
    this.name,
    this.imageUrl,
    this.price,
    this.color,
    this.key,
  }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<EditProduct> {
  //fct (value) bech tsati state l champ
  void changedAttribut(name,description,price,moreInfo,category) {
    widget.name= name;
    
  }

  @override
  Widget build(BuildContext context) {
    // final Product pp = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            AddImage(widget.imageUrl),
            Padding(
              padding: const EdgeInsets.only(
                top: 24.0,
                left: 24.0,
                right: 24.0,
                bottom: 4.0,
              ),
              child: AddDetails(
                update: widget.update,
                moreInfo: widget.moreInfo,
                description: widget.description,
                productName: widget.name,
                price: widget.price,
                changedAtrribut: changedAttribut,
              ),
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomizedButton(
              textName: 'Cancel',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CustomizedButton(
              textName: 'Save',
              onPressed: () {
                widget.update 
                ? widget.productService.updateProduct(widget.id, widget.name, widget.description, widget.moreInfo, widget.price, widget.imageUrl)
                : widget.productService.addProduct(widget.name, widget.description, widget.moreInfo, widget.price, widget.category, widget.imageUrl)
              },
            ),
          ],
        ),
      ),
    );
  }
}
