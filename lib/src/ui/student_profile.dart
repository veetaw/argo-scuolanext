import 'package:flutter/material.dart';
import 'package:scuolanext/scuolanext.dart';

import '../locale/locales.dart';

// TODO BETTER DESIGN
final Client client =  Client();

class StudentProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
         _Header(),
         _Element(
          RELocalizations.of(context).phoneNumber,
          client.student.phoneNumber,
        ),
         Divider(),
         _Element(
          RELocalizations.of(context).studentID,
          client.student.cf,
        ),
         Divider(),
         _Element(
          RELocalizations.of(context).address,
          "${client.student.address}, ${client.student.zipCode}",
        ),
         Divider(),
         _Element(
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
    return  Container(
      margin:  EdgeInsets.all(8.0),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           Text(
            title,
            style: TextStyle(color: Colors.black54, fontSize: 16.0),
          ),
           Padding(
            padding:  EdgeInsets.all(4.0),
          ),
           Text(
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
    return  Container(
      margin:  EdgeInsets.only(bottom: 16.0),
      padding:  EdgeInsets.all(16.0),
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
      child:  Container(
        child:  Text(
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
