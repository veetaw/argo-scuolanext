import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String error;

  ErrorScreen(this.error);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Center(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             Image(
              image:  AssetImage("assets/icons/icon_bw.png"),
              height: 200.0,
              width: 200.0,
            ),
             Text(error == null ? "Unknown error." : error),
          ],
        ),
      ),
    );
  }
}
