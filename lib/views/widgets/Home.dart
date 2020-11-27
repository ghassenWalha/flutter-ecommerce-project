import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/views/widgets/search_item.dart';

class Home extends StatelessWidget {
  final String title;
  final String imgurl;

  Home({this.title, this.imgurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.3,
      child: Stack(children: [
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  color: Colors.black45,
                  iconSize: MediaQuery.of(context).size.width / 13,
                  onPressed: () {
                    showSearch(context: context, delegate: SearchItem());
                  },
                  icon: Icon(Icons.search),
                ))),
        Padding(
            padding: EdgeInsets.only(left: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 30, color: Colors.white60),
                )))
      ]),
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(imgurl), fit: BoxFit.fitWidth)),
    );
  }
}
