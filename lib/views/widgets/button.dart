import 'package:flutter/material.dart';

/*class Button extends StatefulWidget {
  int quantity;
  Button(this.quantity);
  @override
  State<StatefulWidget> createState() {
    return ButtonState(quantity);
  }
}*/

class ButtonItem extends StatelessWidget {
  int quantity;
  //ButtonState(this.quantity);

  /*void addQuantity() {
    setState(() {
      quantity++;
    });
  }

  void substractQuantity() {
    setState(() {
      quantity--;
    });
  }*/

  Function adQuantity;
  ButtonItem(this.adQuantity, this.quantity);

  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.07,
        child: Row(children: [
          Container(
            margin: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width * 0.07,
            height: MediaQuery.of(context).size.height * 0.04,
            child: RaisedButton(
              onPressed: quantity > 1 ? adQuantity : null,
              child: Text(
                '-',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Text(quantity.toString()),
          Container(
            margin: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width * 0.07,
            height: MediaQuery.of(context).size.height * 0.04,
            child: RaisedButton(
                onPressed:
                    //print('quantity : ');
                    //print(quantity);
                    adQuantity
                //print(quantity);
                ,
                child: Text(
                  '+',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                )),
          ),
        ]));
  }
}
