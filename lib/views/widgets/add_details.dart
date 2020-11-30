import 'package:flutter/material.dart';
import '../widgets/customized_button.dart';
import '../screens/bag_screen.dart';
import '../screens/product_details_screen.dart';

class AddDetails extends StatefulWidget {
  @override
  _AddDetailsState createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  var _formKey = GlobalKey<FormState>();
  String _productName, _price, _desccription, _moreInfo;
  void cancelEdit() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BagScreen(),
        ));
  }

  void saveEdit() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    //_formKey.currentState.save();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Product Name',
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please enter Product Name";
                  }
                },
                onSaved: (input) => _productName = input,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please enter Price";
                  }
                },
                onSaved: (input) => _price = input,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please enter Description";
                  }
                },
                onSaved: (input) => _desccription = input,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'More Info',
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please enter the More Info";
                  }
                },
                onSaved: (input) => _moreInfo = input,
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomizedButton('Cancel', cancelEdit),
            CustomizedButton('Save', saveEdit),
          ],
        ),
      ),
    );
  }
}
