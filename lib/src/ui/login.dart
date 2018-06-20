import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scuolanext/scuolanext.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../locale/locales.dart';
import '../util/shared_preferences.dart';
import 'home.dart';

final TextEditingController _schoolCodeController =  TextEditingController();
final TextEditingController _usernameController =  TextEditingController();
final TextEditingController _passwordController =  TextEditingController();

class Login extends StatefulWidget {
  static String get routeName => "login";

  @override
  LoginState createState() =>  LoginState();
}

class LoginState extends State<Login> {
  bool _obscured = true;

  Future<bool> _login() async {
    String schoolCode = "ss${_schoolCodeController.text}",
        username = _usernameController.text,
        password = _passwordController.text;

    if (schoolCode.length < 3 || username.isEmpty || password.isEmpty)
      return false;

    final Client client =  Client();
    final FlutterSecureStorage storage =  FlutterSecureStorage();
    final SharedPreferences prefs =  SharedPreferences();

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

    storage.write(
      key: 'school_code',
      value: client.schoolCode,
    );

    prefs.setLogged();
    return true;
  }

  // todo fixme: bottom overflows on landscape
  // probably it overflows on devices with a small screen
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Container(
        padding:  EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
             Expanded(
              flex: 2,
              child:  Align(
                child:  Text(
                  RELocalizations.of(context).login,
                  style:  TextStyle(
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
             Expanded(
              flex: 4,
              child:  Column(
                children: <Widget>[
                   Padding(
                    padding:  EdgeInsets.all(8.0),
                    child:  TextField(
                      controller: _schoolCodeController,
                      decoration:  InputDecoration(
                        border:  OutlineInputBorder(
                          borderRadius:  BorderRadius.all(
                             Radius.circular(8.0),
                          ),
                        ),
                        labelText: RELocalizations.of(context).schoolCode,
                        prefixText: 'ss',
                        prefixIcon:  Padding(
                          padding:  EdgeInsets.all(8.0),
                          child:  Icon(
                            Icons.school,
                          ),
                        ),
                      ),
                    ),
                  ),
                   Padding(
                    padding:  EdgeInsets.all(8.0),
                    child:  TextField(
                      controller: _usernameController,
                      decoration:  InputDecoration(
                        border:  OutlineInputBorder(
                          borderRadius:  BorderRadius.all(
                             Radius.circular(8.0),
                          ),
                        ),
                        labelText: RELocalizations.of(context).username,
                        prefixIcon:  Padding(
                          padding:  EdgeInsets.all(8.0),
                          child:  Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                    ),
                  ),
                   Padding(
                    padding:  EdgeInsets.all(8.0),
                    child:  TextField(
                      controller: _passwordController,
                      obscureText: _obscured,
                      decoration:  InputDecoration(
                        border:  OutlineInputBorder(
                          borderRadius:  BorderRadius.all(
                             Radius.circular(8.0),
                          ),
                        ),
                        labelText: RELocalizations.of(context).password,
                        prefixIcon:  Padding(
                          padding:  EdgeInsets.all(8.0),
                          child:  Icon(
                            Icons.vpn_key,
                          ),
                        ),
                        suffixIcon:  IconButton(
                          padding: EdgeInsets.zero,
                          icon:  Icon(
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
             Expanded(
              flex: 0,
              child:  FloatingActionButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 0.0,
                child:  Icon(
                  Icons.arrow_forward_ios,
                ),
                onPressed: () async {
                  bool ok = await _login();
                  if (!ok) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return  AlertDialog(
                          title:  Text(
                            RELocalizations.of(context).login,
                          ),
                          content:  Text(
                            RELocalizations.of(context).loginFailed,
                          ),
                        );
                      },
                    );
                  } else {
                    Navigator.of(context).pushReplacementNamed(Home.routeName);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
