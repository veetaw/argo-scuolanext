import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scuolanext/scuolanext.dart';

import 'package:intl/date_symbol_data_local.dart';

import '../locale/locales.dart';

List<Absence> absences;

class Absences extends StatelessWidget {
  final Client client =  Client();

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: client.absences(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            absences = snapshot.data;
            return  Container(
              child:  ListView.builder(
                padding:  EdgeInsets.all(8.0),
                itemCount: absences.length,
                itemBuilder: (BuildContext context, int i) {
                  return  ListTile(
                    title:  Text(
                      RELocalizations.of(context).absence(
                            absences[i].joinedLessonAt == null
                                ? 0
                                : absences[i].joinedLessonAt,
                          ),
                    ),
                    subtitle:  Text(absences[i].registeredBy),
                    leading:  LeadingWidget(i),
                    trailing:  Material(
                      type: MaterialType.circle,
                      color: absences[i].justified ? Colors.green : Colors.red,
                      child:  Container(
                        width: 10.0,
                        height: 10.0,
                      ),
                    ),
                  );
                },
              ),
            );
          default:
            return  Center(
              child:  CircularProgressIndicator(),
            );
        }
      },
    );
  }
}

class LeadingWidget extends StatelessWidget {
  final int i;

  LeadingWidget(this.i);

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: initializeDateFormatting(
        RELocalizations.localeCode,
        null,
      ),
      builder: (BuildContext tileContext, AsyncSnapshot tileSnapshot) {
        if (tileSnapshot.connectionState != ConnectionState.done)
          return  Center(
            child:  CircularProgressIndicator(),
          );

        return  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             Text(
              absences[i].date.day.toString(),
              style:  TextStyle(
                fontSize: 36.0,
                color: Theme.of(context).primaryColorDark,
                fontWeight: FontWeight.w500,
                letterSpacing: -.1,
              ),
            ),
             Text(
               DateFormat.MMMM().format(absences[i].date),
              maxLines: 1,
              style:  TextStyle(
                fontSize: 10.0,
                color: Theme.of(context).primaryColorDark,
                fontWeight: FontWeight.w300,
                letterSpacing: -.3,
              ),
            ),
          ],
        );
      },
    );
  }
}
