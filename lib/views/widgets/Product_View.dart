import "package:flutter/material.dart";
import '../../models/product.dart';

class ProductView extends StatefulWidget {
  final Product product;
  ProductView(
    this.product,
  );
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Hero(
        tag: this.widget.product.id,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child: InkWell(
              enableFeedback: true,
              onDoubleTap: () {
                setState(() {
                  isFav = !isFav;
                });
              },
              child: Container(
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: isFav
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
                        isFav = !isFav;
                      });
                    },
                  ),
                ),
                width: MediaQuery.of(context).size.width / 3.5,
                height: MediaQuery.of(context).size.width / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    image: NetworkImage(
                      this.widget.product.imgUrl,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Text(
            this.widget.product.name,
            style: TextStyle(fontSize: 25),
          ),
          Text(
            "\$${this.widget.product.price} ",
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
        ]),
      ),
    );
  }
}
