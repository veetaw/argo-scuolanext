import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/locale/locales.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      supportedLocales: RELocalizationsDelegate.supportedLocales
          .map((String lang) => new Locale(lang)),
      localizationsDelegates: [
        new RELocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      onGenerateTitle: (context) => RELocalizations.of(context).title,
      home: new Container(), // todo
    );
  }
}
