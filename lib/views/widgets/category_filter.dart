import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/views/widgets/product_grid_view.dart';

import 'custom_action_bar.dart';
import 'filters.dart';

class CategoryFilter extends StatelessWidget {
  List<String> filters = ["price", "date", "likes"];

  @override
  Widget build(BuildContext context) {
    String category = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      alignment: Alignment.center,
                      child: Image(
                        image: AssetImage("assets/images/back_arrow.png"),
                        color: Colors.white,
                        width: 16.0,
                        height: 16.0,
                      ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 120,
                      alignment: Alignment.center,
                      child: Text(
                        category,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                  Filters()
                ]),
                Flexible(
                    child: ProductGridView(
                  [
                    for (var i = 1; i < 7; i++)
                      Product(
                          id: i,
                          name: "sofa",
                          description: "#######",
                          category: "sofa",
                          price: "19.00",
                          imgUrl: [
                            "assets/images/$i.jpg",
                            "assets/images/$i.jpg",
                            "assets/images/$i.jpg",
                            "assets/images/$i.jpg",
                            "assets/images/$i.jpg",
                            "assets/images/$i.jpg",
                            "assets/images/$i.jpg",
                            "assets/images/$i.jpg",
                            "assets/images/$i.jpg",
                            "assets/images/$i.jpg",
                            "assets/images/$i.jpg",
                            "assets/images/$i.jpg",
                            "assets/images/$i.jpg",
                          ]),
                  ],
                ))
              ],
            )));
  }
}
