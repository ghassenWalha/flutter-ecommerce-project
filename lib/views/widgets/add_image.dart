import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImage extends StatefulWidget {
  //final List<String> urls;
  //AddImage(this.urls);
  @override
  _State createState() => _State();
}

class _State extends State<AddImage> {
  int limit = 4;
  int _selectedPage = 0;
  File _image;
  //bool _visible = false;

  Future _getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      limit++;
      //_visible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      child: Stack(
        // we used Stack to have the images and the dots ,to show which picture you're on, together
        children: [
          PageView(
            // to swipe and see all images
            onPageChanged: (num) {
              setState(() {
                _selectedPage = num;
              });
            },
            children: [
              for (var i = 1; i < 5; i++)
                Container(
                  child: Image(
                    image: AssetImage("assets/images/$i.jpg"),
                    fit: BoxFit.cover,
                    width: 200,
                    height: 250,
                  ),
                ),
              GestureDetector(
                onTap: _getImage,
                child: Container(
                  color: Colors.black12,
                  child: _image == null
                      ? Icon(
                          FontAwesomeIcons.plus,
                        )
                      : Stack(
                          children: [
                            Image.file(_image),
                          ],
                        ),
                  width: 200,
                  height: 250,
                ),
              )
            ],
          ),
          Positioned(
            bottom: 20.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < limit; i++)
                  AnimatedContainer(
                    // Animated Container to have a better visualitation of the dots of every pic
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic,
                    margin: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    width: _selectedPage == i ? 35.0 : 10.0,
                    height: 12.0,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
              ],
            ),
          ),
          _selectedPage < limit
              ? Positioned(
                  top: 1,
                  right: 1,
                  child: IconButton(icon: Icon(Icons.cancel), onPressed: null),
                )
              : Container(),
        ],
      ),
    );
  }
}
