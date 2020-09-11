import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gestao_app/models/user.dart';
import 'package:gestao_app/pages/home/body.dart';
import 'package:gestao_app/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../register/body.dart';
import 'components/form_login.dart';
import 'components/logo_image.dart';
import 'components/register_label.dart';
import 'components/title_form.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _irParaTelaRegistro() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Register()));
    }

    void _irParaTelaPrincipal() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ));
    }

    Future<void> _saveTokenOnSession({String response}) async {
      String token = response;
      print(token);
      final prefs = await SharedPreferences.getInstance();
      final key = 'token';
      final value = token;
      prefs.setString(key, value);
    }

    void _showModalError() {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Text('Usuário ou senha inválidos'),
            );
          });
    }

    void _realizarLogin(String email, String password) async {
      var user = User(username: email, password: password);
      var responseOfAuthObject = await AuthService()
          .getToken(user)
          .then((value) => value)
          .catchError((e) => {});

      if (responseOfAuthObject.token == null)
        _showModalError();
      else {
        await _saveTokenOnSession(
            response: responseOfAuthObject.token.toString());
        _irParaTelaPrincipal();
      }
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
