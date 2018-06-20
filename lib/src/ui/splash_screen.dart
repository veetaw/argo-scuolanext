import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Center(
        child:  Image(
          image:  AssetImage("assets/icons/icon_bw.png"),
          height: 200.0,
          width: 200.0,
        ),
      ),
    );
  }
}
