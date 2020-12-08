import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/models/user.dart';
import 'package:flutter_ecommerce_project/views/widgets/rounded_button.dart';
import 'package:flutter_ecommerce_project/views/widgets/rounded_input_field.dart';
import 'package:flutter_ecommerce_project/views/widgets/rounded_password_field.dart';
import 'package:flutter_ecommerce_project/views/screens/login.dart';
import 'package:http/http.dart' as http;

class RegistartionScreen extends StatefulWidget {
  @override
  _RegistartionScreenState createState() => _RegistartionScreenState();
}

class _RegistartionScreenState extends State<RegistartionScreen> {
  Future<User> addUser(name, email, password) async {
    final url = "http://192.168.1.2:3002/api/users/";
    print("hi");

    
       
    try {
      final response = await http.post(url,
          headers: {"content-type": "application/json"},
          body:  json.encode({"name": name, "email": email, "password": password}));
      print(response.body);
      return User();
    } catch (e) {
      print(e);
    }
  }

  TextEditingController emailContoller = TextEditingController();
  TextEditingController usernameContoller = TextEditingController();
  TextEditingController passwordContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
              height: size.height * 0.1,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Sign up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome to our App",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
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
                                    "New",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Account",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                RoundedInputField(
                                  controller: emailContoller,
                                  hintText: "Your Email",
                                  onChanged: (value) {},
                                ),
                                RoundedInputField(
                                  controller: usernameContoller,
                                  hintText: "Username",
                                  onChanged: (value) {},
                                ),
                                RoundedPasswordField(
                                  controller: passwordContoller,
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ),
                          RoundedButton(
                            text: "SIGNUP",
                            press: () {
                              addUser(usernameContoller.text,
                                  emailContoller.text, passwordContoller.text);
                            },
                          ),
                          Text(
                            "Already have an Account ?",
                            style: TextStyle(color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                            child: Text("Sign In",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          )
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
}
