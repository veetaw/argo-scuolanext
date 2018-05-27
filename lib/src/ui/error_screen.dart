import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String error;

  ErrorScreen(this.error);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Image(
              image: new AssetImage("assets/icons/icon_bw.png"),
              height: 200.0,
              width: 200.0,
            ),
            new Text(error == null ? "Unknown error." : error),
          ],
        ),
      ),
    );
  }
}
