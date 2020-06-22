import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 120,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/icon.png"),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
