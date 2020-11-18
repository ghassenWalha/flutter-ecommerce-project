import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/views/widgets/button.dart';
 
// ignore: must_be_immutable
class MyBag extends StatelessWidget {
 

  String color;
  String name;
  double price;
  String imageUrl;
  MyBag(name,imageUrl,price,color)
  {
    this.name=name;
    this.price=price;
    this.color=color;
    this.imageUrl=imageUrl;
  }
 
  @override
  Widget build(BuildContext context) {
    return  
      
       Container(
         
         child: 
          Row(
           children :[
             Expanded(child: 
            Container(
              height:130,
              width:130,
              decoration: 
              BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(image: new AssetImage(imageUrl),fit: BoxFit.contain)
                  )
                  ),),
            Container(
               padding: EdgeInsets.only(left:8,right: 4),
               child: 
                 Column (
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children:[
                   SizedBox(height: 5),
                   Text(name, style: TextStyle(fontSize: 16)),
                   SizedBox(height: 5),
                    Text('\$'+price.toString(),style: TextStyle(fontSize: 16)),
                    SizedBox(height: 40),
                    Text(color,style: TextStyle(color :Colors.grey,)),
                     ]),
            )
            ,
           Expanded(
              child: 
             Container(
               height: 200,
               width: 200,
               child:
               Stack( 
                children: [
                  Positioned(
                    right: 0,

                  
                    child: 
                      Container(
                        padding: EdgeInsets.only(top: 40),

                        child: Column(
                          
                          
                          children:
                           [
                            IconButton(icon: Icon(Icons.delete), onPressed: null) ,
                            SizedBox(height: 40),
                            Button(),
                           
                           ],
                         ),
                      ) 
                           )
                       ]
                    
                  )))
               
           
           ]
 
            
           ),
       );
     
        }

  
}