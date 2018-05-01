import 'package:flutter/material.dart';

final TextEditingController _schoolCodeController = new TextEditingController();
final TextEditingController _usernameController = new TextEditingController();
final TextEditingController _passwordController = new TextEditingController();

class Login extends StatefulWidget {
  static String get routeName => "login";

  @override
  LoginState createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  bool _obscured = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: const EdgeInsets.only(top: 24.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Align(
              child: new Text(
                "Login", // todo localization
                style: const TextStyle(
                  fontSize: 40.0,
                ),
              ),
            ),
            new TextField(
              controller: _schoolCodeController,
              decoration: new InputDecoration(
                labelText: "School code", // todo localization
                prefixText: 'ss',
                prefixIcon: new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Icon(Icons.school),
                ),
              ),
            ),
            new TextField(
              controller: _usernameController,
              decoration: new InputDecoration(
                labelText: "Username", // todo localization
                prefixIcon: new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Icon(Icons.person),
                ),
              ),
            ),
            new TextField(
              controller: _passwordController,
              obscureText: _obscured,
              decoration: new InputDecoration(
                labelText: "password", // todo localization
                prefixIcon: new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Icon(Icons.vpn_key),
                ),
                suffixIcon: new IconButton(
                  padding: EdgeInsets.zero,
                  icon: new Icon(
                      _obscured ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => setState(() => _obscured = !_obscured),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
