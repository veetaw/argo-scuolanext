import 'package:flutter/material.dart';
import 'package:scuolanext/scuolanext.dart';

final Client client = Client();

class Votes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView (
      
    );
  }
}

class Vote extends StatelessWidget {
  Subject subject;
  Vote(this.subject);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: double.infinity,
      child: new Card(
        elevation: 2.0,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Text(
                  subject.name,
                  maxLines: 1,
                  style: new TextStyle(
                    letterSpacing: .3,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                new Text(
                  subject.teacher,
                  maxLines: 1,
                  style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            new _CircleAverageVote(),
          ],
        ),
      ),
    );
  }
}

class _CircleAverageVote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}