import 'package:flutter/material.dart';
import 'package:gestao_app/models/person.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerApp extends StatefulWidget {
  final Person logged;
  final Function() logOff;
  DrawerApp({this.logged, this.logOff});
  @override
  _DrawerAppState createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text(
                      widget.logged?.username,
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.logged?.name,
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  widget.logged?.email,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Text(
                  widget.logged?.id,
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            onTap: () {},
            title: Text('Início'),
          ),
          ListTile(
            leading: Icon(Icons.money_off),
            onTap: () {},
            title: Text('Contas'),
          ),
          ListTile(
            leading: Icon(Icons.info),
            onTap: () {},
            title: Text('Trabalhos'),
          ),
          ListTile(
            leading: Icon(Icons.live_tv),
            onTap: () {},
            title: Text('Canais'),
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            onTap: () {},
            title: Text('Bancos'),
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            onTap: widget.logOff,
            title: Text('Sair'),
          ),
        ],
      ),
    );
  }
}
