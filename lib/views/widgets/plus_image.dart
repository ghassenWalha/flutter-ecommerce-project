import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class PlusImage extends StatefulWidget {
  Function _getImage;
  File _image;
  PlusImage(this._getImage, this._image);
  @override
  _PlusImageState createState() => _PlusImageState();
}

class _PlusImageState extends State<PlusImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.widget._getImage,
      child: Container(
        color: Colors.black12,
        child: this.widget._image == null
            ? Icon(
                FontAwesomeIcons.plus,
              )
            : Stack(
                children: [
                  Image.file(this.widget._image),
                ],
              ),
        width: 200,
        height: 250,
      ),
    );
  }
}
