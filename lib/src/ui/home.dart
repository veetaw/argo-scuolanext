import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:scuolanext/scuolanext.dart';

import '../locale/locales.dart';
import 'absences.dart';

class Home extends StatefulWidget {
  static String get routeName => "home";
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  final Client client = new Client();
  final FlutterSecureStorage storage = new FlutterSecureStorage();

  Widget currentBody;

  @override
  void initState() {
    _checkSession();
    super.initState();
  }

  Future _checkSession() async {
    if (client.token == null || client.token.isEmpty) {
      await client.initClient(
        schoolCode: await storage.read(key: 'school_code'),
        token: await storage.read(key: 'token'),
      );
    }
  }

  void _changeBody(Widget body, BuildContext context) {
    currentBody = body;
    // pop drawer's navigator and call rebuild ui
    Navigator.of(context).pop();
    setState(() {});
  }

  // todo icons..
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: _checkSession(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return new Scaffold(
              body: new Center(
                child: new CircularProgressIndicator(),
              ),
            );
          default:
            return new Scaffold(
              appBar: new AppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                elevation: .5,
                textTheme: Theme.of(context).textTheme,
                iconTheme: Theme.of(context).iconTheme,
                title: new Text(
                  RELocalizations.of(context).title,
                ),
              ),
              drawer: new Drawer(
                child: new ListView(
                  padding: const EdgeInsets.all(0.0),
                  children: <Widget>[
                    new UserAccountsDrawerHeader(
                      accountName: new Text(
                        "${client.student.surname} ${client.student.name}",
                        style: new TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: .2,
                        ),
                      ),
                      accountEmail: null,
                      currentAccountPicture: new CircleAvatar(
                        child: new Text(
                          "${client.student.surname[0]} ${client.student.name[0]}",
                          style: new TextStyle(
                            wordSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                    new DrawerTile(
                      icon: Icons.book,
                      text: RELocalizations.of(context).absences,
                      onClick: () {
                        _changeBody(
                          new Absences(),
                          context,
                        );
                      },
                    ),
                    new DrawerTile(
                      icon: Icons.table_chart,
                      text: RELocalizations.of(context).timetable,
                      onClick: () {},
                    ),
                    new DrawerTile(
                      icon: Icons.looks_6,
                      text: RELocalizations.of(context).votes,
                      onClick: () {},
                    ),
                    new DrawerTile(
                      icon: Icons.calendar_today,
                      text: RELocalizations.of(context).homeworks,
                      onClick: () {},
                    ),
                    new Divider(),
                    // todo account
                    new DrawerTile(
                      icon: Icons.info,
                      text: RELocalizations.of(context).info,
                      onClick: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return new AlertDialog(
                              title: new Text(
                                "TODO",
                              ),
                            );
                          },
                        );
                      },
                    ),
                    new DrawerTile(
                      icon: Icons.settings,
                      text: RELocalizations.of(context).settings,
                      onClick: () {},
                    ),
                    new Divider(),
                    new DrawerTile(
                      icon: Icons.exit_to_app,
                      text: RELocalizations.of(context).exit,
                      onClick: () {},
                    ),
                  ],
                ),
              ),
              body: currentBody,
            );
        }
      },
    );
  }
}

class DrawerTile extends StatelessWidget {
  DrawerTile({
    this.icon,
    this.text,
    this.onClick,
  });

  final IconData icon;
  final String text;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new Icon(icon),
      title: new Text(
        text,
        style: new TextStyle(
          fontWeight: FontWeight.w500,
          letterSpacing: .2,
        ),
      ),
      onTap: onClick,
    );
  }
}
