import 'package:flutter/material.dart';
 
class MyBag extends StatelessWidget {
   int index=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
       Container(
         child: 
          Row(
           children :[
            Container(
              height:100,
              width:100,
              decoration: 
              BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(image: new AssetImage('assets/sofa.jpg'),fit: BoxFit.contain)
                  )
                  ),
            Container(
               padding: EdgeInsets.only(left:8,right: 4),
               child: 
                 Column (
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children:[
                   SizedBox(height: 5),
                   Text("Sofa Velure ", style: TextStyle(fontSize: 16)),
                   SizedBox(height: 5),
                    Text("\$500",style: TextStyle(fontSize: 16)),
                    SizedBox(height: 40),
                    Text("Color:blue",style: TextStyle(color :Colors.grey,)),
                     ]),
            ),
            Expanded(
              child: 
               Stack( 
                children: [
                  Positioned(
                    right: 0,
                    child: 
                      Column(
                        children:
                         [
                          IconButton(icon: Icon(Icons.delete), onPressed: null) ,
                          SizedBox(height: 40),
                          Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: 
                            [
                                Container(
                                  margin:EdgeInsets.all(8),
                                  width:25,
                                  height: 25,
                                  child: 
                                    RaisedButton(
                                     onPressed: (){index--;},
                                     child :
                                        Text('-', textAlign: TextAlign.center,),  
                                                 ),
                                ),
                                Text(index.toString()),
                                Container(
                                  margin:EdgeInsets.all(8),
                                  width:25,
                                  height: 25,
                                  child: 
                                   RaisedButton(onPressed:() {index++;},
                                    child :
                                       Text('+',textAlign: TextAlign.center,)
                                                ),
                                ),
                                SizedBox(width: 10),
                            ],
                         )
                       ]
                     )
                  )
               ]
              )
             )
 
            ],
           ),
       ),
      );
        }

  
}