import 'package:flutter/material.dart';

/* this widget present an element of the category widget .
 it is formed by column widget that contains an image ,
  and a text widget that contains the category label _ souheil  */
class CategoryItem extends StatelessWidget {
  final String title;
  final String path;

  CategoryItem({this.title, this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.width / 4,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(path)),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
            ),
            Container(
                width: 200,
                padding: EdgeInsets.all(10),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    )))
          ],
        ));
  }
}
