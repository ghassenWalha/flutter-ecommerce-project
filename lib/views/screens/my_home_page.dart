import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/views/screens/admin_screen.dart';
import 'package:flutter_ecommerce_project/views/screens/bag_screen.dart';

import 'package:flutter_ecommerce_project/views/screens/home_screen.dart';
import 'package:flutter_ecommerce_project/views/screens/loginIn_registration_screen.dart';
import 'package:flutter_ecommerce_project/views/screens/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController;
  int currentIndex = 0;
  Map decodedToken;

  void onSelect(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      this.currentIndex = index;
      pageController.animateToPage(
          ((index == 3) && (prefs.get("token") != null))
              ? 4
              : currentIndex, // check if the user is already logged in or not
          duration: Duration(milliseconds: 30),
          curve: Curves.linear);
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = new PageController();
  }

  List<Widget> _screens = [
    HomeScreen(),
    Center(child: AdminScreen()),
    Center(
      child: BagScreen(),
    ),
    LoginInRegistrationScreen(),
    Center(
      child: Profile(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    String token;
    return Container(
        child: FutureBuilder(
            future: SharedPreferences.getInstance(),
            builder: (BuildContext context,
                AsyncSnapshot<SharedPreferences> snapshot) {
              if (snapshot.hasData) {
                token = snapshot.data.getString("token");
                if (token != null) {
                  decodedToken = JwtDecoder.decode(token);
                  if (decodedToken["isAdmin"]) {
                    // change the navbar if the usr is admin
                    _screens[1] = Center(child: BagScreen());
                  }
                }
              } else {}
              return Scaffold(
                  body: PageView(
                    controller: pageController,
                    onPageChanged: (index) async {
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
                      ((token != null) && decodedToken["isAdmin"])
                          ? BottomNavigationBarItem(
                              icon: Icon(Icons.lock), label: "admin Dashbord")
                          : BottomNavigationBarItem(
                              icon: Icon(Icons.favorite), label: "favorite"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.shopping_bag), label: "Bag"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person), label: "login/sign in"),
                    ],
                    currentIndex: currentIndex >= 3 ? 3 : currentIndex,
                    onTap: onSelect,
                  ));
            }));
  }
}
