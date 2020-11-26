import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://3docean.img.customer.envatousercontent.com/files/268616478/preview.jpg?auto=compress%2Cformat&fit=crop&crop=top&max-h=8000&max-w=590&s=a7ee51e76b43acca1e220db7edad8ad9"))),
    );
  }
}
