import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:scuolanext/scuolanext.dart';

import '../locale/locales.dart';

class Home extends StatefulWidget {
  static String get routeName => "home";
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  final Client client = new Client();
  final FlutterSecureStorage storage = new FlutterSecureStorage();

  @override
  void initState() async {
    if (client.token == null || client.token.isEmpty) {
      await client.initClient(
        schoolCode: await storage.read(key: 'school_code'),
        token: await storage.read(key: 'token'),
      );
    }
    super.initState();
  }

  // todo icons..
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(
                "${client.student.surname} ${client.student.name}",
              ),
              accountEmail: null,
              currentAccountPicture: new CircleAvatar(
                child: new Icon(
                  Icons.person,
                ),
              ),
            ),
            new DrawerElement(
              icon: Icons.book,
              text: RELocalizations.of(context).absences,
              onClick: () {},
            ),
            new DrawerElement(
              icon: Icons.table_chart,
              text: RELocalizations.of(context).timetable,
              onClick: () {},
            ),
            new DrawerElement(
              icon: Icons.looks_6,
              text: RELocalizations.of(context).votes,
              onClick: () {},
            ),
            new DrawerElement(
              icon: Icons.calendar_today,
              text: RELocalizations.of(context).homeworks,
              onClick: () {},
            ),
            new Divider(),
            // todo account
            new DrawerElement(
              icon: Icons.info,
              text: 'info', // todo translation
              onClick: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return new Text(
                      "TODO",
                    );
                  },
                );
              },
            ),
            new DrawerElement(
              icon: Icons.settings,
              text: 'settings', // todo translation
              onClick: () {},
            ),
            new Divider(),
            new DrawerElement(
              icon: Icons.exit_to_app,
              text: 'exit', // todo translation
              onClick: () {},
            ),
          ],
        ),
      ),
      body: new Container(),
    );
  }
}

class DrawerElement extends StatelessWidget {
  DrawerElement({
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
      title: new Text(text),
      onTap: onClick,
    );
  }
}
