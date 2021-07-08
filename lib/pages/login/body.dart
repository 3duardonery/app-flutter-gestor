import 'package:flutter/material.dart';
import 'package:gestao_app/models/user.dart';
import 'package:gestao_app/pages/home/body.dart';
import 'package:gestao_app/services/auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../register/body.dart';
import 'components/form_login.dart';
import 'components/logo_image.dart';
import 'components/register_label.dart';
import 'components/title_form.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String nameTest = "";
  bool loading = false;

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

    Future<void> _getTokenFromSession() async {
      final prefs = await SharedPreferences.getInstance();
      final key = 'token';
      var tokenResult = prefs.getString(key);

      if (tokenResult.isNotEmpty) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ));
      }
    }

    Future<void> _saveTokenOnSession({String response}) async {
      String token = response;
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
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 80,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Text(
                    'Usuário ou senha inválidos',
                    style: GoogleFonts.roboto(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            );
          });
    }

    void _realizarLogin(String email, String password) async {
      setState(() {
        loading = !loading;
      });
      var user = User(username: email, password: password);
      var responseOfAuthObject = await AuthService()
          .getToken(user)
          .then((value) => value)
          .catchError((e) => {});

      setState(() {
        loading = !loading;
      });

      if (responseOfAuthObject.data == null) {
        _showModalError();
      } else {
        await _saveTokenOnSession(
            response: responseOfAuthObject.data.token.toString());
        _irParaTelaPrincipal();
      }
    }

    // @override
    // void initState() {
    //   super.initState();
    //   //_getTokenFromSession();
    // }

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
                FormLogin(_realizarLogin, loading),
                RegisterLabel(_irParaTelaRegistro),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
