import 'package:flutter/material.dart';
import '../widgets/bag_list.dart';


class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //appBar: AppBar(title: Text('Flutter App')),
      body:Column(
        
        children: [
        Card ( 
         
          child :
          Container(
            color: Colors.white,

             padding: EdgeInsets.only(top:70,bottom: 2),
          width: double.infinity,
          
          child :Text('My Bag',
          style: TextStyle(fontSize: 30)),
          ), 
          
          ),
          Container(
        color: Colors.white,
        width: double.infinity,
         height: 550,
          padding: EdgeInsets.only(bottom: 0),
         child : BagList(),
          )
        ]) ,
    
         
    
    
    );
  
  }
 
   
  
}

