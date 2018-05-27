import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:connectivity/connectivity.dart';

import 'src/locale/locales.dart';
import 'src/ui/error_screen.dart';
import 'src/ui/home.dart';
import 'src/ui/intro.dart';
import 'src/ui/login.dart';
import 'src/ui/splash_screen.dart';
import 'src/util/shared_preferences.dart';

void main() => runApp(new App());

class App extends StatefulWidget {
  final SharedPreferences sharedPreferences = new SharedPreferences();

  @override
  AppState createState() {
    return new AppState();
  }
}

class AppState extends State<App> {
  bool _error = false;

  @override
  void initState() {
    Connectivity connectivity = new Connectivity();
    connectivity.checkConnectivity().then((ConnectivityResult c) => setState(
        () => c == ConnectivityResult.none ? _error = true : _error = false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => new MaterialApp(
        supportedLocales: [
          const Locale('en', ''),
          const Locale('it', ''),
        ],
        localizationsDelegates: [
          const RELocalizationsDelegate(),
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        routes: {
          Intro.routeName: (BuildContext context) => new Intro(),
          Login.routeName: (BuildContext context) => new Login(),
          Home.routeName: (BuildContext context) => new Home(),
        },
        onGenerateTitle: (context) => RELocalizations.of(context).title,
        theme: new ThemeData(
          fontFamily: 'GoogleProductSans',
          iconTheme: new IconThemeData(
            color: Colors.black,
          ),
        ),
        home: new FutureBuilder(
          future: widget.sharedPreferences.initPrefs(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.waiting:
                return new SplashScreen();
              default:
                if (_error)
                  return new ErrorScreen(
                    RELocalizations.of(context).noConnectionError,
                  );
                return widget.sharedPreferences.isFirstTime
                    ? new Intro()
                    : widget.sharedPreferences.isLogged
                        ? new Home()
                        : new Login();
            }
          },
        ),
      );
}
