import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image(
          image: new AssetImage("assets/icons/icon_bw.png"),
          height: 200.0,
          width: 200.0,
        ),
      ),
    );
  }
}
