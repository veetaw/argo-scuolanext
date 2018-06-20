// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a messages locale. All the
// messages from the main program should be duplicated here with the same
// function name.

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages =  MessageLookup();

// ignore: unused_element
final _keepAnalysisHappy = Intl.defaultLocale;

// ignore: non_ant_identifier_names
typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'messages';

  static m0(hour) => "${Intl.plural(hour, one: 'One hour late', two: 'Two hours late', other: 'Absence')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "absence" : m0,
    "absences" : MessageLookupByLibrary.simpleMessage("absences"),
    "address" : MessageLookupByLibrary.simpleMessage("Address"),
    "birthday" : MessageLookupByLibrary.simpleMessage("Birthday"),
    "exit" : MessageLookupByLibrary.simpleMessage("exit"),
    "homeworks" : MessageLookupByLibrary.simpleMessage("homeworks"),
    "info" : MessageLookupByLibrary.simpleMessage("info"),
    "introButtonText" : MessageLookupByLibrary.simpleMessage("login"),
    "introSubTitleFirst" : MessageLookupByLibrary.simpleMessage("This is an UNOFFICIAL app"),
    "introSubTitleSecond" : MessageLookupByLibrary.simpleMessage("Help developer to fix bugs with the report button."),
    "introTitleFirst" : MessageLookupByLibrary.simpleMessage("Welcome to Argo ScuolaNext"),
    "introTitleSecond" : MessageLookupByLibrary.simpleMessage("Contribute to the app development"),
    "login" : MessageLookupByLibrary.simpleMessage("Login"),
    "loginFailed" : MessageLookupByLibrary.simpleMessage("Login failed, check your credentials"),
    "noConnectionError" : MessageLookupByLibrary.simpleMessage("Enable your mobile connection or connect to a wifi to use this application"),
    "notes" : MessageLookupByLibrary.simpleMessage("notes"),
    "password" : MessageLookupByLibrary.simpleMessage("Password"),
    "phoneNumber" : MessageLookupByLibrary.simpleMessage("Phone Number"),
    "reminders" : MessageLookupByLibrary.simpleMessage("reminders"),
    "schoolCode" : MessageLookupByLibrary.simpleMessage("School code"),
    "settings" : MessageLookupByLibrary.simpleMessage("settings"),
    "studentID" : MessageLookupByLibrary.simpleMessage("ID"),
    "teachers" : MessageLookupByLibrary.simpleMessage("teachers"),
    "timetable" : MessageLookupByLibrary.simpleMessage("timetable"),
    "title" : MessageLookupByLibrary.simpleMessage("RE"),
    "username" : MessageLookupByLibrary.simpleMessage("Username"),
    "votes" : MessageLookupByLibrary.simpleMessage("votes")
  };
}
