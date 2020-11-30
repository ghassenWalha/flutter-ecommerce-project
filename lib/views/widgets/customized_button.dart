import 'package:flutter/material.dart';

class CustomizedButton extends StatefulWidget {
  Function fct;
  final String textName;
  CustomizedButton(this.textName, this.fct);
  @override
  _CustomizedButtonState createState() => _CustomizedButtonState();
}

class _CustomizedButtonState extends State<CustomizedButton> {
  //bool test = (textName == "Save") ? true : false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      child: FloatingActionButton(
        heroTag: this.widget.textName,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
        backgroundColor:
            widget.textName == 'Save' ? Colors.black : Colors.white,
        onPressed: this.widget.fct,
        child: Text(
          widget.textName,
          style: TextStyle(
            color: widget.textName == 'Cancel' ? Colors.black : Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
