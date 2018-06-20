// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a it locale. All the
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
  get localeName => 'it';

  static m0(hour) => "${Intl.plural(hour, one: 'Ingresso alla prima ora', two: 'Ingresso in seconda ora', other: 'Assenza')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "absence" : m0,
    "absences" : MessageLookupByLibrary.simpleMessage("Assenze"),
    "address" : MessageLookupByLibrary.simpleMessage("Indirizzo"),
    "birthday" : MessageLookupByLibrary.simpleMessage("Compleanno"),
    "exit" : MessageLookupByLibrary.simpleMessage("Esci"),
    "homeworks" : MessageLookupByLibrary.simpleMessage("Compiti"),
    "info" : MessageLookupByLibrary.simpleMessage("Info"),
    "introButtonText" : MessageLookupByLibrary.simpleMessage("login"),
    "introSubTitleFirst" : MessageLookupByLibrary.simpleMessage("Questa applicazione NON è ufficiale"),
    "introSubTitleSecond" : MessageLookupByLibrary.simpleMessage("Aiuta lo sviluppatore a risolverne i problemi con il tasto apposito."),
    "introTitleFirst" : MessageLookupByLibrary.simpleMessage("Benvenuto in Argo Scuolanext"),
    "introTitleSecond" : MessageLookupByLibrary.simpleMessage("Contribuisci allo sviluppo dell\'applicazione"),
    "login" : MessageLookupByLibrary.simpleMessage("Accesso"),
    "loginFailed" : MessageLookupByLibrary.simpleMessage("Accesso fallito, controlla le credenziali"),
    "noConnectionError" : MessageLookupByLibrary.simpleMessage("Attiva la tua connessione ad internet o connettiti ad una rete WiFi per usare questa applicazione."),
    "notes" : MessageLookupByLibrary.simpleMessage("Note"),
    "password" : MessageLookupByLibrary.simpleMessage("Password"),
    "phoneNumber" : MessageLookupByLibrary.simpleMessage("Numero di cellulare"),
    "reminders" : MessageLookupByLibrary.simpleMessage("Promemoria"),
    "schoolCode" : MessageLookupByLibrary.simpleMessage("Codice scuola"),
    "settings" : MessageLookupByLibrary.simpleMessage("Impostazioni"),
    "studentID" : MessageLookupByLibrary.simpleMessage("Codice Fiscale"),
    "teachers" : MessageLookupByLibrary.simpleMessage("Insegnanti"),
    "timetable" : MessageLookupByLibrary.simpleMessage("Orario"),
    "title" : MessageLookupByLibrary.simpleMessage("Registro elettronico"),
    "username" : MessageLookupByLibrary.simpleMessage("Nome utente"),
    "votes" : MessageLookupByLibrary.simpleMessage("Voti")
  };
}
