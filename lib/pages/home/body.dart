import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _token = "";
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    _getTokenFromStorage().then((value) {
      setState(() {
        _token = value;
      });
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
      body: Text('Token carregado com sucesso: $_token'),
    );
  }
}
