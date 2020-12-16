import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImage extends StatefulWidget {
  final List<String> urls;
  AddImage(this.urls);
  @override
  _State createState() => _State();
}

class _State extends State<AddImage> {
  int limit = 4;
  int _selectedPage = 0;
  List<File> _images = [];
  List<String> _images1 = [];
  //bool _visible = false;

  void supprimer(int i) {
    if (i < _images1.length)
      setState(() {
        limit--;
        _images1.removeAt(i);
      });
    else
      setState(() {
        limit--;
        _images.removeAt(i - _images1.length);
      });
  }

  void initState() {
    super.initState();
    for (var i = 1; i < 5; i++) {
      _images1.add(this.widget.urls[i]);
    }
  }

  Future _getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null)
      setState(() {
        _images.add(image);
        limit++;
        //_visible = true;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
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
              ..._images1.map(
                (image) => Container(
                  child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.fill,
                    width: 200,
                    // height: 250,
                  ),
                ),
              ),
              ..._images.map((image) {
                return Container(
                  color: Colors.black12,
                  child: Stack(
                    children: [
                      Image.file(
                        image,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                  width: 200,
                  height: 250,
                );
              }).toList(),
              GestureDetector(
                onTap: _getImage,
                child: Container(
                  color: Colors.black12,
                  child: Icon(
                    FontAwesomeIcons.plus,
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
                  child: IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () => supprimer(_selectedPage)),
                )
              : Container(),
        ],
      ),
    );
  }
}
