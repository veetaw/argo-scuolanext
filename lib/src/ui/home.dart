import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:scuolanext/scuolanext.dart';

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
