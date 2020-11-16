import 'package:flutter/material.dart';
import '../widgets/my_bag.dart';


class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //appBar: AppBar(title: Text('Flutter App')),
      body:
      Column(
        
        children: [
        Card ( 
         
          child :
          Container(
             padding: EdgeInsets.only(top:70,bottom: 2),
          width: double.infinity,
          child :Text('My Bag',
          style: TextStyle(fontSize: 40)),
          ), 
          
          ),
          Container(
             width: double.infinity,
         height: 150,
          padding: EdgeInsets.only(top:11,bottom: 0),
         child : MyBag())
          
        ]) ,
    );
  
  }
 
   
  
}

