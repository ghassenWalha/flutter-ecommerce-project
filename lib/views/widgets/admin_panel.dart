import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/services/ProductService.dart';
import 'package:flutter_ecommerce_project/views/widgets/product_item_admin.dart';

import 'package:flutter_ecommerce_project/fixtures/fixture.dart';

import '../../models/product.dart';

/*
This class displays the list of Products for the administrator
_Zohra&Amal
*/
class AdminPanel extends StatefulWidget {
  @override
  AdminPanelState createState() => AdminPanelState();
}

class AdminPanelState extends State<AdminPanel> {
 ProductService productService = ProductService();

   
   
  /*This function removes a widget when we click on the  delete button*/
  void remove(id) {
    setState(() {
     productService.deleteProduct(id);
    });
  }

/* Here we build the list */




  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.78,
          
          child: 
              FutureBuilder(future:productService.getProducts(),
          builder: (BuildContext context , AsyncSnapshot<List<Product>> snapshot){
            print("hey");
      
            if (snapshot.hasData){
              print("11111");
              List<Product> products = snapshot.data;
             
              return ListView.builder(

              itemCount: products.length,
              itemBuilder: (context, i) {
                return 
                //Container(child: Text('name:'+products[i].name),)
                
                ProductItemAdmin(
                  product: Product(name: products[i].name,
                  imgsUrl: products[i].imgsUrl,
                  price:products[i].price,
                  category: products[i].category, 
                  description: products[i].description),                /*color: products[i].,*/
                  /*quantity: products[i].,*/
                  key: ValueKey(products[i].name),
                  /*index: i,*/
                  remove:null /*remove*/,
                )
                ;
              });
            }else{
              return Center(child: Text('no data'),);
            }
          }
          
        )
          
          
          
        )
      ]),
    );
  }
}
