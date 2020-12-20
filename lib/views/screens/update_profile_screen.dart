import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/views/widgets/rounded_button.dart';
import 'package:flutter_ecommerce_project/views/widgets/rounded_input_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController;
    TextEditingController nameController;
    bool changed = false;
    Map decodedToken = ModalRoute.of(context).settings.arguments;

    emailController = TextEditingController(text: decodedToken["email"]);
    nameController = TextEditingController(text: decodedToken["name"]);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(color: Colors.black87),
                child: Column(children: [
                  Container(
                    width: size.width,
                    height: 80,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                        shape: BoxShape.rectangle),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Update Profile",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  Expanded(
                      child: Container(
                          child: Padding(
                              padding:
                                  EdgeInsets.only(top: 50, left: 15, right: 15),
                              child: Column(children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 30),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "UserName",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 25),
                                            ),
                                          )),
                                      RoundedInputField(
                                        controller: nameController,
                                        onChanged: (value) {
                                          changed = true;
                                        },
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Email",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 25,
                                              ),
                                            ),
                                          )),
                                      RoundedInputField(
                                        controller: emailController,
                                        onChanged: (value) {
                                          changed = true;
                                        },
                                      ),
                                      SizedBox(
                                        height: size.height * 0.04,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: RoundedButton(
                                      text: "UPDATE",
                                      color: Colors.grey,
                                      press: () {
                                        if (!changed) {
                                          print(emailController.text);
                                          print(emailController.value);
                                        }
                                      },
                                    )),
                                Container(
                                    child: RoundedButton(
                                  text: "CANCEL",
                                  color: Colors.black,
                                  press: () {
                                    Navigator.of(context).pop();
                                  },
                                ))
                              ]))))
                ]))));
  }
}
