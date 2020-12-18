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
  final Product oldProduct ;
  final bool update ;
  EditProduct({this.oldProduct,this.update});
  @override
  _State createState() => _State();
}

class _State extends State<EditProduct> {
Map product;
  //fct (value) bech tsati state l champ
  @override
  void initState() {
    print(widget.oldProduct);
   product=widget.oldProduct.toJson() ;
      product['price'] = product['price'].toString();

    super.initState();
  }
  void attributeChangedHundler(String attributeName, dynamic value) {
    print('here');
setState(() {
  product[attributeName] = value.toString();
});
   
  }
ProductService productService = new ProductService();
  @override
  Widget build(BuildContext context) {

  
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            AddImage(product["imgsUrl"] ?? [] ),
            Padding(
              padding: const EdgeInsets.only(
                top: 24.0,
                left: 24.0,
                right: 24.0,
                bottom: 4.0,
              ),
              child: AddDetails(
                update: widget.update,
              product: product,
                changedAtrribut: attributeChangedHundler,
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
                ? productService.updateProduct(product).then((value) => Navigator.pop(context))
                : productService.addProduct(product);
              },
            ),
          ],
        ),
      ),
    );
  }
}
