import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scuolanext/scuolanext.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../locale/locales.dart';
import '../util/shared_preferences.dart';
import 'home.dart';

final TextEditingController _schoolCodeController = new TextEditingController();
final TextEditingController _usernameController = new TextEditingController();
final TextEditingController _passwordController = new TextEditingController();

class Login extends StatefulWidget {
  static String get routeName => "login";

  @override
  LoginState createState() => new LoginState();
}

class LoginState extends State<Login> {
  bool _obscured = true;

  Future<bool> _login() async {
    String schoolCode = "ss${_schoolCodeController.text}",
        username = _usernameController.text,
        password = _passwordController.text;

    if (schoolCode.length < 3 || username.isEmpty || password.isEmpty)
      return false;

    final Client client = new Client();
    final FlutterSecureStorage storage = new FlutterSecureStorage();
    final SharedPreferences prefs = new SharedPreferences();

    try {
      await client.firstLogin(
        schoolCode: schoolCode,
        username: username,
        password: password,
      );
    } on Exception {
      return false;
    }

    storage.write(
      key: 'token',
      value: client.token,
    );
    prefs.setLogged();
    return true;
  }

  // todo fixme: bottom overflows on landscape
  // probably it overflows on devices with a small screen
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            new Expanded(
              flex: 2,
              child: new Align(
                child: new Text(
                  RELocalizations.of(context).login,
                  style: const TextStyle(
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
            new Expanded(
              flex: 3,
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new TextField(
                      controller: _schoolCodeController,
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(8.0),
                          ),
                        ),
                        labelText: RELocalizations.of(context).schoolCode,
                        prefixText: 'ss',
                        prefixIcon: new Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Icon(
                            Icons.school,
                          ),
                        ),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new TextField(
                      controller: _usernameController,
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(8.0),
                          ),
                        ),
                        labelText: RELocalizations.of(context).username,
                        prefixIcon: new Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new TextField(
                      controller: _passwordController,
                      obscureText: _obscured,
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(8.0),
                          ),
                        ),
                        labelText: RELocalizations.of(context).password,
                        prefixIcon: new Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Icon(
                            Icons.vpn_key,
                          ),
                        ),
                        suffixIcon: new IconButton(
                          padding: EdgeInsets.zero,
                          icon: new Icon(
                            _obscured ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () => setState(
                                () => _obscured = !_obscured,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new FloatingActionButton(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0.0,
              child: new Icon(
                Icons.arrow_forward_ios,
              ),
              onPressed: () async {
                bool ok = await _login();
                if (!ok) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return new Text(
                        RELocalizations.of(context).loginFailed,
                      );
                    },
                  );
                } else {
                  Navigator.of(context).pushReplacementNamed(Home.routeName);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
