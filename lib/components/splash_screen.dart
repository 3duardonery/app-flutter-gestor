import 'package:flutter/material.dart';
import 'package:mooovie_app/pages/login/body.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 5,
          backgroundColor: Theme.of(context).primaryColor,
          navigateAfterSeconds: Login(),
          loaderColor: Color(0xFF34495E),
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/icon.png"),
              fit: BoxFit.none,
            ),
          ),
        ),
      ],
    );
  }
}
