import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../l10n/messages_all.dart';

class RELocalizations {
  static String localeCode;

  static Future<RELocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    RELocalizations.localeCode = localeName;
    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return  RELocalizations();
    });
  }

  static RELocalizations of(BuildContext context) =>
      Localizations.of<RELocalizations>(context, RELocalizations);

  // todo find the best translation for 'Registro Elettronico'
  String get title => Intl.message('RE', name: "title");

  // title
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

  // login
  String get login => Intl.message("Login", name: 'login');
  String get schoolCode => Intl.message("School code", name: 'schoolCode');
  String get username => Intl.message("Username", name: 'username');
  String get password => Intl.message("Password", name: 'password');
  String get loginFailed =>
      Intl.message("Login failed, check your credentials", name: "loginFailed");

  // drawer
  String get absences => Intl.message("absences", name: "absences");
  String get notes => Intl.message("notes", name: "notes");
  String get homeworks => Intl.message("homeworks", name: "homeworks");
  String get reminders => Intl.message("reminders", name: "reminders");
  String get votes => Intl.message("votes", name: "votes");
  String get timetable => Intl.message("timetable", name: "timetable");
  String get teachers => Intl.message("teachers", name: "teachers");
  String get info => Intl.message("info", name: "info");
  String get settings => Intl.message("settings", name: "settings");
  String get exit => Intl.message("exit", name: "exit");

  // todo translate this better
  String absence(int hour) => Intl.plural(
        hour,
        one: "One hour late",
        two: "Two hours late",
        other: "Absence",
        name: "absence",
        args: [hour],
      );

  // profile
  String get phoneNumber => Intl.message("Phone Number", name: "phoneNumber");
  String get address => Intl.message("Address", name: "address");
  String get studentID => Intl.message("ID", name: "studentID");
  String get birthday => Intl.message("Birthday", name: "birthday");

  // errors
  String get noConnectionError => Intl.message(
        "Enable your mobile connection or connect to a WiFi to use this application",
        name: "noConnectionError",
      );
}

class RELocalizationsDelegate extends LocalizationsDelegate<RELocalizations> {
  static  List<String> supportedLocales = ['en', 'it'];

   RELocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      supportedLocales.contains(locale.languageCode);

  @override
  Future<RELocalizations> load(Locale locale) => RELocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<RELocalizations> old) => false;
}
