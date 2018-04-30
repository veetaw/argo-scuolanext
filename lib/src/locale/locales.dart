import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../l10n/messages_all.dart';

class RELocalizations {
  static Future<RELocalizations> load(Locale locale) {
    String name = Intl.canonicalizedLocale(
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString());
    return initializeMessages(name).then((_) {
      Intl.defaultLocale = name;
      return new RELocalizations();
    });
  }

  static RELocalizations of(BuildContext context) =>
      Localizations.of<RELocalizations>(context, RELocalizations);

  // todo find the best translation for 'Registro Elettronico'
  String get title => Intl.message('RE', name: 'title', desc: '');
}

class RELocalizationsDelegate extends LocalizationsDelegate<RELocalizations> {
  static const List<String> supportedLocales = ['en', 'it'];

  const RELocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      supportedLocales.contains(locale.languageCode);

  @override
  Future<RELocalizations> load(Locale locale) => RELocalizations.load(locale);

  //todo
  @override
  bool shouldReload(LocalizationsDelegate<RELocalizations> old) => false;
}
