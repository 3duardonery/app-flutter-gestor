import 'package:flutter/material.dart';
import 'package:mooovie_app/components/splash_screen.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GestorApp',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        accentColor: Colors.blue
      ),
      home: Splash()
    );
  }
}
