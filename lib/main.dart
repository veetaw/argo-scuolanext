import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/locale/locales.dart';
import 'src/ui/error_screen.dart';
import 'src/ui/home.dart';
import 'src/ui/intro.dart';
import 'src/ui/splash_screen.dart';
import 'src/util/shared_preferences.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  final SharedPreferences sharedPreferences = new SharedPreferences();

  @override
  Widget build(BuildContext context) => new MaterialApp(
      supportedLocales: RELocalizationsDelegate.supportedLocales
          .map((String lang) => new Locale(lang)),
      localizationsDelegates: [
        new RELocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      onGenerateTitle: (context) => RELocalizations.of(context).title,
      home: new FutureBuilder(
        future: sharedPreferences.initPrefs(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.waiting:
              return new SplashScreen();
            default:
              if (snapshot.hasError) return new ErrorScreen();
              return sharedPreferences.isFirstTime() ? new Intro() : new Home();
          }
        },
      ));
}
