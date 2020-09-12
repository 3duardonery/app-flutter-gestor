import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gestao_app/components/drawer.dart';
import 'package:gestao_app/models/person.dart';
import 'package:gestao_app/pages/home/components/welcome.dart';
import 'package:gestao_app/utils/descrypt_token.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _token = "";
  Person _logged;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _getTokenFromStorage().then((value) {
      setState(() {
        _token = value;
      });
      _mountPerson();
    });
  }

  void _mountPerson() {
    var person = Person();
    var decodedJson = DescryptToken().decodeBase64(_token);
    person = Person.fromJson(jsonDecode(decodedJson));
    setState(() {
      _logged = person;
    });
  }

  Future<String> _getTokenFromStorage() async {
    SharedPreferences prefs;
    await _prefs.then((value) {
      setState(() {
        prefs = value;
      });
    });

    String tokenFromStorage = prefs.getString("token");
    return tokenFromStorage;
  }

  void _logOff() {
    print('Remover token do storage e sair');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerApp(
        logged: _logged,
        logOff: _logOff,
      ),
      backgroundColor: Color(0xFFF1F0ED),
      appBar: AppBar(
        backgroundColor: Color(0xFFF1F0ED),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Início',
          style: GoogleFonts.roboto(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.grey[500],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {},
        icon: Icon(Icons.playlist_add),
        label: Text('Nova Conta'),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
            ),
            Welcome(_logged?.name),
            Padding(
              padding: EdgeInsets.all(20),
            ),
          ],
        ),
      ),
    );
  }
}
