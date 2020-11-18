import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/views/widgets/Category_Item.dart';
import 'package:flutter_ecommerce_project/views/widgets/Category_List.dart';
import 'package:flutter_ecommerce_project/views/widgets/Product_View.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/views/widgets/Product_List_View.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ProductListView(
          productList: [
            for (var i = 0; i < 7; i++)
              Product(
                id: 1,
                name: "sofa",
                description: "#######",
                price: "19.00",
                imgUrl:
                    "https://www.solentbeds.co.uk/images/products/standard/7526.jpg",
              ),
          ],
        ),
      ),
    );
    /*CategoryList({
      "Sofa":
          "https://www.ikea.com/us/en/images/products/morabo-sofa-gunnared-dark-gray-metal__0602115_PE680184_S5.JPG",
      "chaire":
          "https://3docean.img.customer.envatousercontent.com/files/97175802/chaire%201.jpg?auto=compress%2Cformat&fit=crop&crop=top&max-h=8000&max-w=590&s=845d4a678d6bde450224ca0297c067c7",
      "Table":
          "https://www.cocktail-scandinave.fr/Vbeta2018/wp-content/uploads/2018/02/RGATA180AL.jpg",
      "bed":
          "https://cdn.shopify.com/s/files/1/2660/5202/products/xoir1j2ihw9b4bw2apj5_1400x.jpg?v=1598896503"
    });*/
  }
}
