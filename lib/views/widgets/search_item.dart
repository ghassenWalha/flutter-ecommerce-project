import 'package:flutter/material.dart';
// this widget is responsible for building the search item 
class SearchItem extends SearchDelegate<Widget> {
  // building the list that contains the product names 
  // List<String> namelist = List<String>();
  // int i = 0;
  // List<String> list() {
  //   while (i < bagList.length) {
  //     namelist.add(bagList[i]['name']);
  //     i++;
  //   }
  //   return namelist;
  // }



  @override
  List<Widget> buildActions(BuildContext context) {
    //this button is responsible for clearing the text in the search bar 
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
  
  }

  @override
  Widget buildSuggestions(BuildContext context) {
  //  final suggestionList = (query.isEmpty)
    //    ? list()
      //  : list().where((p) => p.startsWith(query)).toList();
 // building the suggestion list
    return Text("212");
    
    //  ListView.builder(
    //   itemCount: suggestionList.length,
    //   itemBuilder: (context, index) => ListTile(
    //       onTap: () {
    //         query = suggestionList[index];
    //         showResults(context);
    //       },
       
    //       title: Text(suggestionList[index])),
    // );
  }
}
