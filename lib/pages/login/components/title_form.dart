import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 40),
      child: Text(
        'Login',
        style: TextStyle(
          fontSize: 24,
          color: Color(0xFF34495E)
        ),
      ),
    );
  }
}
