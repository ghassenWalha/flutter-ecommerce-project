import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/services/filter_service.dart';

class Filters extends StatefulWidget {
  String category;
  Filters(this.category);
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  FilterService filterService=new FilterService();
  
  void choiceAction(String s) {
    print("working");
  }

  List<String> ch = ["priceLowToHigh","priceHighToLow", "dateHighToLow","dateLowToHigh","likes"];
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.list_rounded,
        color: Colors.black87,
        size: 40,
      ),
      onSelected: choiceAction,
      itemBuilder: (BuildContext context) {
        return ch.map((String choice) {
          return PopupMenuItem<String>(
              child: new GestureDetector( 
                child:new ListTile(
                  leading: Icon(Icons.money), title: Text(choice)),onTap:() async{
                    filterService.getProducts(choice, widget.category);
                    } ));
        }).toList();
      },
    );

    /*Align(
        alignment: Alignment.topRight,
        child: PopupMenuButton<WhyFarther>(
          
            itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
                  const PopupMenuItem<WhyFarther>(
                    value: WhyFarther.harder,
                    child: Text('Working a lot harder'),
                  ),
                  const PopupMenuItem<WhyFarther>(
                    value: WhyFarther.smarter,
                    child: Text('Being a lot smarter'),
                  ),
                  const PopupMenuItem<WhyFarther>(
                    value: WhyFarther.selfStarter,
                    child: Text('Being a self-starter'),
                  ),
                  const PopupMenuItem<WhyFarther>(
                    value: WhyFarther.tradingCharter,
                    child: Text('Placed in charge of trading charter'),
                  ),
                ],
            child: IconButton(
              color: Colors.black87,
              iconSize: 50,
              alignment: Alignment.topRight,
              icon: Icon(
                Icons.list_rounded,
              ),
              onPressed: () {},
            )));*/
  }
}
