import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../l10n/messages_all.dart';

class RELocalizations {
  static Future<RELocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new RELocalizations();
    });
  }

  static RELocalizations of(BuildContext context) =>
      Localizations.of<RELocalizations>(context, RELocalizations);

  // todo find the best translation for 'Registro Elettronico'
  String get title => Intl.message('RE', name: "title");

  String get introButtonText => Intl.message('login', name: "introButtonText");

  String get introTitleFirst =>
      Intl.message('Welcome to Argo ScuolaNext', name: "introTitleFirst");
  String get introSubTitleFirst =>
      Intl.message('This is an UNOFFICIAL app', name: "introSubTitleFirst");

  String get introTitleSecond => Intl
      .message('Contribute to the app development', name: "introTitleSecond");
  String get introSubTitleSecond =>
      Intl.message('Help developer to fix bugs with the report button.',
          name: "introSubTitleSecond");
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
