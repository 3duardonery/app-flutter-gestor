import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gestao_app/models/person.dart';
import 'package:gestao_app/utils/descrypt_token.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      drawer: Drawer(
        key: _scaffoldKey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer'),
            ),
          ],
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
            Row(
              children: [
                Text('Seja bem-vindo ${_logged?.name}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
