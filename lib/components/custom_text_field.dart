import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController emailController;
  final String title;
  final TextInputType type;

  CustomTextField({this.emailController, this.title, this.type}) {}

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: TextField(
        controller: widget.emailController,
        keyboardType: widget.type,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.alternate_email),
          labelText: widget.title,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
