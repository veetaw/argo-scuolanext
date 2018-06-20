import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:scuolanext/scuolanext.dart';

import '../locale/locales.dart';
import 'absences.dart';
import 'student_profile.dart';

class Home extends StatefulWidget {
  static String get routeName => "home";
  @override
  HomeState createState() =>  HomeState();
}

class HomeState extends State<Home> {
  final Client client =  Client();
  final FlutterSecureStorage storage =  FlutterSecureStorage();

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
    return  FutureBuilder(
      future: _checkSession(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return  Scaffold(
              body:  Center(
                child:  CircularProgressIndicator(),
              ),
            );
          default:
            return  Scaffold(
              appBar:  AppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                elevation: .5,
                textTheme: Theme.of(context).textTheme,
                iconTheme: Theme.of(context).iconTheme,
                title:  Text(
                  RELocalizations.of(context).title,
                ),
              ),
              drawer:  Drawer(
                child:  ListView(
                  padding:  EdgeInsets.all(0.0),
                  children: <Widget>[
                     UserAccountsDrawerHeader(
                      accountName:  Text(
                        "${client.student.surname} ${client.student.name}",
                        style:  TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: .2,
                        ),
                      ),
                      accountEmail: null,
                      currentAccountPicture:  InkWell(
                        child:  CircleAvatar(
                          child:  Text(
                            "${client.student.surname[0]} ${client.student.name[0]}",
                            style:  TextStyle(
                              wordSpacing: 2.0,
                            ),
                          ),
                        ),
                        onTap: () => _changeBody(
                              StudentProfile(),
                              context,
                            ),
                      ),
                    ),
                     DrawerTile(
                      icon: Icons.book,
                      text: RELocalizations.of(context).absences,
                      onClick: () => _changeBody(
                             Absences(),
                            context,
                          ),
                    ),
                     DrawerTile(
                      icon: Icons.table_chart,
                      text: RELocalizations.of(context).timetable,
                      onClick: () {},
                    ),
                     DrawerTile(
                      icon: Icons.looks_6,
                      text: RELocalizations.of(context).votes,
                      onClick: () {},
                    ),
                     DrawerTile(
                      icon: Icons.calendar_today,
                      text: RELocalizations.of(context).homeworks,
                      onClick: () {},
                    ),
                     Divider(),
                    // todo account
                     DrawerTile(
                      icon: Icons.info,
                      text: RELocalizations.of(context).info,
                      onClick: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return  AlertDialog(
                              title:  Text(
                                "TODO",
                              ),
                            );
                          },
                        );
                      },
                    ),
                     DrawerTile(
                      icon: Icons.settings,
                      text: RELocalizations.of(context).settings,
                      onClick: () {},
                    ),
                     Divider(),
                     DrawerTile(
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
    return  ListTile(
      leading:  Icon(icon),
      title:  Text(
        text,
        style:  TextStyle(
          fontWeight: FontWeight.w500,
          letterSpacing: .2,
        ),
      ),
      onTap: onClick,
    );
  }
}
