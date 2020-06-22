import 'package:flutter/material.dart';

class RegisterLabel extends StatelessWidget {
  final void Function() registrarNovaConta;

  RegisterLabel(this.registrarNovaConta);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: registrarNovaConta,
      child: Container(
        margin: EdgeInsets.all(30),
        child: Text(
          'Registrar uma nova conta',
          style: TextStyle(
              fontSize: 14,
              color: Color(0xFF34495E),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
