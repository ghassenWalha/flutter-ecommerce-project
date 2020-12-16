import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  final List<String> list;

  Filters(this.list);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  void choiceAction(String s) {
    print("working");
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.list_rounded,
        color: Colors.black87,
        size: 40,
      ),
      onSelected: choiceAction,
      itemBuilder: (BuildContext context) {
        return (this.widget.list).map((String choice) {
          return PopupMenuItem<String>(
              child: new ListTile(
                  leading: Icon(Icons.money), title: Text(choice)));
        }).toList();
      },
    );
  }
}
