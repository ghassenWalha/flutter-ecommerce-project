import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../screens/bag_screen.dart';
import '../screens/product_details_screen.dart';

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
    //final Product product = ModalRoute.of(context).settings.arguments;
    //print(product.imgUrl);
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            //AddImage(product.imgUrl),
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
      ),
    );
  }
}
