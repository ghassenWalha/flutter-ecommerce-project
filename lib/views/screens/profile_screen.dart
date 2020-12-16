import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/views/screens/login.dart';
import 'package:flutter_ecommerce_project/views/widgets/rounded_button.dart';
import 'package:flutter_ecommerce_project/views/widgets/rounded_input_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Text("profile"),
      Container(
          child: RoundedButton(
        text: "logout",
        color: Colors.black,
        press: () async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.remove("token");
          prefs.remove("email");
          prefs.remove("username");
          Navigator.pushNamed(context, "/");
        },
      ))
    ]));
  }
}

/*  Size size = MediaQuery.of(context).size;

    Future<SharedPreferences> prefs = SharedPreferences.getInstance();

    TextEditingController emailContoller;
    TextEditingController nameContoller;

    
      print(value.getString("email"));
      print(value.getString("username"));

      emailContoller = TextEditingController(text: value.getString("email"));
      nameContoller = TextEditingController(text: value.getString("username"));
    
     


    return /FutureBuilder<SharedPreferences>(future:prefs ,builder: null) Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.orange[800],
            Colors.orange[700],
            Colors.orange[300]
          ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Profile",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Padding(
                    padding: EdgeInsets.all(30),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "UserName",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                RoundedInputField(
                                  controller: nameContoller,
                                  onChanged: (value) {},
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Email",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                RoundedInputField(
                                  controller: emailContoller,
                                  onChanged: (value) {},
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                              ],
                            ),
                          ),
                          Container(
                              child: RoundedButton(
                            text: "update",
                            color: Colors.orange,
                            press: () async {},
                          )),
                          Container(
                              child: RoundedButton(
                            text: "logout",
                            color: Colors.black,
                            press: () async {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.remove("token");
                              prefs.remove("email");
                              prefs.remove("username");
                              Navigator.pushNamed(context, "/");
                            },
                          ))
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
