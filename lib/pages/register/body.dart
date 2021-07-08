import 'package:flutter/material.dart';

import 'components/form_register.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Color(0xFF6F879E), opacity: 1, size: 20),
        backgroundColor: Color(0xFFF1F0ED),
        centerTitle: true,
        title: Text(
          'Cadastro',
          style: TextStyle(fontSize: 20, color: Color(0xFF6F879E)),
        ),
        elevation: 0,
        actions: <Widget>[],
      ),
      backgroundColor: Color(0xFFF1F0ED),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Dados do usuário',
                  style: TextStyle(color: Color(0xFF34495E), fontSize: 22),
                ),
                FormRegister()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
