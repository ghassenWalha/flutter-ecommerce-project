import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/category.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/views/widgets/search_item.dart';
import 'package:flutter_ecommerce_project/views/widgets/titled_category_list.dart';
import 'package:flutter_ecommerce_project/views/widgets/titled_product_list.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /*String url = 'localhost:3002/api/categories';
List list;
  bool _isDataLoading = true;

  Future<List> _getCategories() async{

    var response = await http.get(
      Uri.encodeFull(url),
      headers: {"Accept": 'application/json'},
    );
      setState(() {

      var listData = json.decode(response.body);
      list = listData['results'];

      _isDataLoading = false;
    });
    return list;
  }
  */
  List<Product> productGenerator() {
    List<Product> list = [];

    for (var i = 6; i > 0; i--)
      list.add(Product(
          id: i.toString(),
          name: "table",
          price: 1200.0,
          description: "mlmlmlmlm",
          category: "sofa",
          imgsUrl: [
            "assets/images/$i.jpg",
            "assets/images/$i.jpg",
            "assets/images/$i.jpg",
            "assets/images/$i.jpg",
            "assets/images/$i.jpg",
            "assets/images/$i.jpg",
            "assets/images/$i.jpg",
            "assets/images/$i.jpg",
          ]));
    return list;
  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        "assets/images/5.jpg",
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.3,
        fit: BoxFit.fill,
      ),
      Positioned(
        child: IconButton(
          color: Colors.white,
          iconSize: MediaQuery.of(context).size.width / 13,
          onPressed: () {
            showSearch(context: context, delegate: SearchItem());
          },
          icon: Icon(Icons.search),
        ),
        right: 15,
        top: 30,
      ),
      Positioned(
        child: Text(
          "New Collection",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        top: MediaQuery.of(context).size.height / 4.6,
        left: 10,
      ),
      Positioned(
        top: MediaQuery.of(context).size.height / 2.7,
        child: Container(
            height: MediaQuery.of(context).size.height / 1.7,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                TitledCategoryList(title: "Categories", categoryList: [
                  for (var i = 1; i < 10/*list.length*/; i++)
                    Category(
                        id: 10/*list[i]['id']*/,
                        name: 'sofa' /*list[i]['name']*/,
                        imageUrl: '/assets/sofa.jpg'/*list[i]['imageUrl'])*/,
                )]),
                Container(
                    height: (MediaQuery.of(context).size.height / 4) * 1.8,
                    child: TitledProductList(
                        title: "Best sellers", productList: productGenerator()))
              ]),
            )),
      )
    ]);
  }
}
