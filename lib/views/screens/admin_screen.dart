import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/views/widgets/admin_panel.dart';
import 'package:flutter_ecommerce_project/views/widgets/search_item.dart';

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.grey[400],
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            onPressed: () {
              showSearch(context: context, delegate: SearchItem());
            },
            icon: Icon(Icons.search),
          )
        ],
        centerTitle: true,
        title: Text(
          'Search Bar',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(bottom: 0),
            child: AdminPanel(),
          )
        ]),
      ),
    );
  }
}
