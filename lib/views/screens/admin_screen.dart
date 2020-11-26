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
      body: Column(children: [
        AdminPanel(),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[400],
        onPressed: null,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
