import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Button_State();
  }
}

class Button_State extends State<Button> {
  int quantity = 1;
  @override
  void addQuantity() {
    setState(() {
      quantity++;
    });
  }

  void substractQuantity() {
    setState(() {
      quantity--;
    });
  }

  Widget build(BuildContext context) {
    return Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Container(
        margin: EdgeInsets.all(8),
        width: 25,
        height: 25,
        child: RaisedButton(
          onPressed: quantity > 1 ? substractQuantity : null,
          //color: Colors.grey[400],
          child: Text(
            '-',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
      Text(
        quantity.toString(),
      ),
      Container(
        margin: EdgeInsets.all(8),
        width: 25,
        height: 25,
        child: RaisedButton(
            //color: Colors.grey[400],
            onPressed: addQuantity,
            child: Text(
              '+',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            )),
      ),
      SizedBox(width: 10),
    ]));
  }
}
