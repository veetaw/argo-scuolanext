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

void main() => runApp( App());

class App extends StatefulWidget {
  final SharedPreferences sharedPreferences =  SharedPreferences();

  @override
  AppState createState() {
    return  AppState();
  }
}

class AppState extends State<App> {
  bool _error = false;

  @override
  void initState() {
    Connectivity connectivity =  Connectivity();
    connectivity.checkConnectivity().then((ConnectivityResult c) => setState(
        () => c == ConnectivityResult.none ? _error = true : _error = false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>  MaterialApp(
        supportedLocales: [
           Locale('en', ''),
           Locale('it', ''),
        ],
        localizationsDelegates: [
           RELocalizationsDelegate(),
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        routes: {
          Intro.routeName: (BuildContext context) =>  Intro(),
          Login.routeName: (BuildContext context) =>  Login(),
          Home.routeName: (BuildContext context) =>  Home(),
        },
        onGenerateTitle: (context) => RELocalizations.of(context).title,
        theme:  ThemeData(
          fontFamily: 'GoogleProductSans',
          iconTheme:  IconThemeData(
            color: Colors.black,
          ),
        ),
        home:  FutureBuilder(
          future: widget.sharedPreferences.initPrefs(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.waiting:
                return  SplashScreen();
              default:
                if (_error)
                  return  ErrorScreen(
                    RELocalizations.of(context).noConnectionError,
                  );
                return widget.sharedPreferences.isFirstTime
                    ?  Intro()
                    : widget.sharedPreferences.isLogged
                        ?  Home()
                        :  Login();
            }
          },
        ),
      );
}
