import 'package:flutter/material.dart';
import 'package:scuolanext/scuolanext.dart';

import '../locale/locales.dart';

// TODO BETTER DESIGN
final Client client = new Client();

class StudentProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        new _Header(),
        new _Element(
          RELocalizations.of(context).phoneNumber,
          client.student.phoneNumber,
        ),
        new Divider(),
        new _Element(
          RELocalizations.of(context).studentID,
          client.student.cf,
        ),
        new Divider(),
        new _Element(
          RELocalizations.of(context).address,
          "${client.student.address}, ${client.student.zipCode}",
        ),
        new Divider(),
        new _Element(
          RELocalizations.of(context).birthday,
          client.student.birth
              .toString()
              .split(" ")[0], // todo internationalize this
        ),
      ],
    );
  }
}

class _Element extends StatelessWidget {
  final String title;
  final String content;

  _Element(this.title, this.content);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.all(8.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            title,
            style: TextStyle(color: Colors.black54, fontSize: 16.0),
          ),
          new Padding(
            padding: const EdgeInsets.all(4.0),
          ),
          new Text(
            content,
            style: TextStyle(fontSize: 20.0),
          )
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Color(client.student.sex.toLowerCase() == "m"
                ? 0xFF42a5f5
                : 0xFFf48fb1),
            Color(client.student.sex.toLowerCase() == "m"
                ? 0xFF0d47a1
                : 0xFFd81b60),
          ],
        ),
      ),
      child: new Container(
        child: new Text(
          "${client.student.surname} ${client.student.name}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
