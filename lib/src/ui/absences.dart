import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scuolanext/scuolanext.dart';

import 'package:intl/date_symbol_data_local.dart';

import '../locale/locales.dart';

List<Absence> absences;

class Absences extends StatelessWidget {
  final Client client = new Client();

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: client.absences(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            absences = snapshot.data;
            return new Container(
              child: new ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: absences.length,
                itemBuilder: (BuildContext context, int i) {
                  return new ListTile(
                    title: new Text(
                      RELocalizations.of(context).absence(
                            absences[i].joinedLessonAt == null
                                ? 0
                                : absences[i].joinedLessonAt,
                          ),
                    ),
                    subtitle: new Text(absences[i].registeredBy),
                    leading: new LeadingWidget(i),
                    trailing: new Material(
                      type: MaterialType.circle,
                      color: absences[i].justified ? Colors.green : Colors.red,
                      child: new Container(
                        width: 10.0,
                        height: 10.0,
                      ),
                    ),
                  );
                },
              ),
            );
          default:
            return new Center(
              child: new CircularProgressIndicator(),
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
    return new FutureBuilder(
      future: initializeDateFormatting(
        RELocalizations.localeCode,
        null,
      ),
      builder: (BuildContext tileContext, AsyncSnapshot tileSnapshot) {
        if (tileSnapshot.connectionState != ConnectionState.done)
          return new Center(
            child: new CircularProgressIndicator(),
          );

        return new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text(
              absences[i].date.day.toString(),
              style: new TextStyle(
                fontSize: 36.0,
                color: Theme.of(context).primaryColorDark,
                fontWeight: FontWeight.w500,
                letterSpacing: -.1,
              ),
            ),
            new Text(
              new DateFormat.MMMM().format(absences[i].date),
              maxLines: 1,
              style: new TextStyle(
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
