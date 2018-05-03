// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a it locale. All the
// messages from the main program should be duplicated here with the same
// function name.

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

// ignore: unused_element
final _keepAnalysisHappy = Intl.defaultLocale;

// ignore: non_constant_identifier_names
typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'it';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "introButtonText" : MessageLookupByLibrary.simpleMessage("login"),
    "introSubTitleFirst" : MessageLookupByLibrary.simpleMessage("Questa applicazione NON è ufficiale"),
    "introSubTitleSecond" : MessageLookupByLibrary.simpleMessage("Aiuta lo sviluppatore a risolverne i problemi con il tasto apposito."),
    "introTitleFirst" : MessageLookupByLibrary.simpleMessage("Benvenuto in Argo Scuolanext"),
    "introTitleSecond" : MessageLookupByLibrary.simpleMessage("Contribuisci allo sviluppo dell\'applicazione"),
    "login" : MessageLookupByLibrary.simpleMessage("Accesso"),
    "loginFailed" : MessageLookupByLibrary.simpleMessage("Accesso fallito, controlla le credenziali"),
    "password" : MessageLookupByLibrary.simpleMessage("Password"),
    "schoolCode" : MessageLookupByLibrary.simpleMessage("Codice scuola"),
    "title" : MessageLookupByLibrary.simpleMessage("Registro elettronico"),
    "username" : MessageLookupByLibrary.simpleMessage("Nome utente")
  };
}
