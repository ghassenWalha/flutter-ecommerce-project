import "package:flutter/material.dart";
import '../../models/product.dart';

class ProductView extends StatefulWidget {
  final Product product;
  ProductView({
    this.product,
  });
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: this.widget.product.id,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.width / 3,
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
            Container(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    this.widget.product.name,
                    style: TextStyle(fontSize: 25),
                  ),
                )),
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "\$${this.widget.product.price} ",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
            ),
          ],
        ));
  }
}
