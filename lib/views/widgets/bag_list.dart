import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/views/widgets/my_bag.dart';



class BagList extends StatefulWidget {
  @override
  BagListState createState() => BagListState();
}



class BagListState extends State<BagList> {
  
  var bagList=[
    {'imageUrl' : 'assets/velvet_chair.jpg',
    'price':300.00,
    'color': 'pink',
     'name': 'Velvet Chair',
    },

   {'imageUrl' : 'assets/sofa.jpg',
    'price':350.00,
    'color': 'yellow',
    'name': 'sofa',

    },
    
    {'imageUrl' : 'assets/chair.jpg',
    'price':200.00,
    'color': 'Grey',
    'name': 'Chair',

    },
    {'imageUrl' : 'assets/table.jpg',
    'price':150.00,
    'color': 'Grey',
    'name': 'Table',

    }

   



  ];


    
 



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return ListView.builder(
    itemCount: bagList.length, // Nombre d'élément dans votre liste de données (ici data)
    itemBuilder: (context,i) {
        // Construction du widget à répéter
        return MyBag(bagList[i]['name'],bagList[i]['imageUrl'],bagList[i]['price'],bagList[i]['color']);
     });

       
}
}
