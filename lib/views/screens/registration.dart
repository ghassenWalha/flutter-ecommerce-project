import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/models/user.dart';
import 'package:flutter_ecommerce_project/services/user_service.dart';
import 'package:flutter_ecommerce_project/views/widgets/rounded_button.dart';
import 'package:flutter_ecommerce_project/views/widgets/rounded_input_field.dart';
import 'package:flutter_ecommerce_project/views/widgets/rounded_password_field.dart';
import 'package:flutter_ecommerce_project/views/screens/login.dart';

class RegistartionScreen extends StatefulWidget {
  @override
  _RegistartionScreenState createState() => _RegistartionScreenState();
}

class _RegistartionScreenState extends State<RegistartionScreen> {
  TextEditingController emailContoller = TextEditingController();
  TextEditingController usernameContoller = TextEditingController();
  TextEditingController passwordContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
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
                          final user = UserService().addUser(
                              usernameContoller.text,
                              emailContoller.text,
                              passwordContoller.text);
                          user.then((value) {
                            if ((value.name != null)) {
                              Navigator.pushNamed(context, "/");
                            }
                          });
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
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
