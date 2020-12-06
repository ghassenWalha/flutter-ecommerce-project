import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/views/screens/admin_screen.dart';
import 'package:flutter_ecommerce_project/views/screens/bag_screen.dart';
import 'package:flutter_ecommerce_project/views/screens/edit_product.dart';

import 'package:flutter_ecommerce_project/views/screens/home_screen.dart';
import 'package:flutter_ecommerce_project/views/screens/loginIn_registration_screen.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController;
  int currentIndex = 0;
  void onSelect(int index) {
    setState(() {
      this.currentIndex = index;
      pageController.animateToPage(currentIndex,
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = new PageController();
  }

  List<Widget> _screens = [
    HomeScreen(),
    Center(
      child: AdminScreen(),
    ),
    Center(
      child: BagScreen(),
    ),
    LoginInRegistrationScreen()
    //Center(

      
      //   child: CustomNavigationBar(
      // iconSize: 30.0,
      // selectedColor: Color(0xff0c18fb),
      // strokeColor: Color(0x300c18fb),
      // unSelectedColor: Colors.grey[600],
      // backgroundColor: Colors.white,
      // items: [
      //   CustomNavigationBarItem(
      //     icon: Icon(
      //       AntDesign.home,
      //     ),
      //   ),
      //   CustomNavigationBarItem(
      //     icon: Icon(
      //       AntDesign.search1,
      //     ),
      //   ),
      //   CustomNavigationBarItem(
      //     icon: Icon(
      //       AntDesign.shoppingcart,
      //     ),
      //   ),
      //   CustomNavigationBarItem(
      //     icon: Icon(
      //       AntDesign.user,
      //     ),
      //   ),
      // ],
    //)
   // )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: _screens,
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock), label: "admin Dashbord"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: "Bag"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "login/sign in"),
          ],
          currentIndex: currentIndex,
          onTap: onSelect,
        ));

    /*CustomNavigationBar(
          iconSize: 30.0,
          selectedColor: Colors.orangeAccent,
          strokeColor: Color(0x300c18fb),
          unSelectedColor: Colors.black.withOpacity(0.7),
          backgroundColor: Colors.blueGrey.withOpacity(0.3),
          items: [
            CustomNavigationBarItem(
              icon: Icon(
                AntDesign.home,
              ),
            ),
            CustomNavigationBarItem(
              icon: Icon(
                AntDesign.setting,
              ),
            ),
            CustomNavigationBarItem(
              icon: Icon(
                AntDesign.shoppingcart,
              ),
            ),
            CustomNavigationBarItem(
              icon: Icon(
                AntDesign.user,
              ),
            ),
          ],
          currentIndex: currentIndex,
          onTap: onSelect,
        )*/
  }
}
