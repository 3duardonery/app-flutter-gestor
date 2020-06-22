import 'package:flutter/material.dart';
import 'package:mooovie_app/pages/login/components/form_login.dart';
import 'package:mooovie_app/pages/register/body.dart';

import 'components/logo_image.dart';
import 'components/register_label.dart';
import 'components/title_form.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    void _irParaTelaRegistro() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
    }

    void _realizarLogin(String email, String password) {
      print(email);
      print(password);
    }

    return Scaffold(
      backgroundColor: Color(0xFFF1F0ED),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LogoImage(),
                FormTitle(),
                FormLogin(_realizarLogin),
                RegisterLabel(_irParaTelaRegistro),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
