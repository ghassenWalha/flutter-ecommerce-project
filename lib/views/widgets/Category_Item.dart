import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/category.dart';

/* this widget present the category widget .
 it is formed by column widget that contains an image ,
  and a text widget that contains the category label _ souheil  */
class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 3,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.width / 4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(category.imageUrl), fit: BoxFit.fill),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      category.name,
                      style: TextStyle(fontSize: 20, color: Colors.black38),
                    )))
          ],
        ));
  }
}
