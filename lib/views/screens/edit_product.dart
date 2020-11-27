import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
//import 'package:flutter_ecommerce_project/models/product.dart';

import '../widgets/add_image.dart';
import '../widgets/add_details.dart';
import '../widgets/customized_button.dart';

class EditProduct extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<EditProduct> {
  @override
  Widget build(BuildContext context) {
    final Product pp = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            AddImage(),
            Padding(
              padding: const EdgeInsets.only(
                top: 24.0,
                left: 24.0,
                right: 24.0,
                bottom: 4.0,
              ),
              child: AddDetails(),
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
