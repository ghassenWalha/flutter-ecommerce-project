import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/category.dart';
import 'package:flutter_ecommerce_project/models/product.dart';

/*

This widget is responsible for creating the Product item for the admin
_Zohra&Amal

*/
class ProductItemAdmin extends StatefulWidget {
 
  Product product;
  //final int quantity
  
  final key;
  final Function remove;

  ProductItemAdmin({
  this.product,
  this.remove,
    this.key,
  }) : super(key: key);
 

  @override
  State<StatefulWidget> createState() {
    return ProductItemAdminState();
  }
}

class ProductItemAdminState extends State<ProductItemAdmin> {
  @override
  Widget build(BuildContext context) {
     return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.22,
      margin: EdgeInsets.only(
        top: 2,
        bottom: 2,
      ),
      child: Row(children: [
        //The picture of the product
        /*  Expanded(
          child:*/
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          padding: EdgeInsets.only(left: 10),
          height: MediaQuery.of(context).size.height * 0.16,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image(
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width * 0.36,
                //height: MediaQuery.of(context).size.height * 0.4,
                image: new NetworkImage(
                  widget.product.imgsUrl[0],
                ),
              )),
        ),
        /*),*/
        //Name,Price and the Color of the Product
        Container(
          width: MediaQuery.of(context).size.width * 0.32, //0.4
          padding: EdgeInsets.only(left: 16), //15
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(widget.product.name, style: TextStyle(fontSize: 16)),
                    Text('\$' + widget.product.price.toString(),
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
                Text('Color : ' //+ widget.color
                ,
                    style: TextStyle(
                      color: Colors.grey,
                    )),
              ]),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.28,
          child: Row(
            children: [
              IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(context, "/edt");
                  }),
              //Delete Icon
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red[400],
                ),
                onPressed: () {
                  widget.remove(widget.product.id);
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
