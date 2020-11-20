import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  bool isFav;
  FavoriteButton(this.isFav);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: this.widget.isFav
            ? Icon(
                Icons.favorite,
                color: Colors.red,
              )
            : Icon(
                Icons.favorite_outline,
                color: Colors.black,
              ),
        onPressed: () {
          setState(() {
            this.widget.isFav = !this.widget.isFav;
          });
        },
      ),
    );
  }
}
