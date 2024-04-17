// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(notesNumber) => "Всего записок: ${notesNumber}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "allNotes": MessageLookupByLibrary.simpleMessage("Мои записки"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "description": MessageLookupByLibrary.simpleMessage("Содержание"),
        "dontHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Нет аккаунта?"),
        "incorrectPassword":
            MessageLookupByLibrary.simpleMessage("Неверный пароль"),
        "incorrectUsername":
            MessageLookupByLibrary.simpleMessage("Неверный логин"),
        "letsWriteWhatsOnYourMind":
            MessageLookupByLibrary.simpleMessage("Давай запишем твои\nмысли!"),
        "logIn": MessageLookupByLibrary.simpleMessage("Вход"),
        "newNote": MessageLookupByLibrary.simpleMessage("Новая записка"),
        "notesnumberNotes": m0,
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "signIn": MessageLookupByLibrary.simpleMessage("Вход"),
        "signUp": MessageLookupByLibrary.simpleMessage("Зарегистрируйтесь"),
        "title": MessageLookupByLibrary.simpleMessage("Заголовок"),
        "username": MessageLookupByLibrary.simpleMessage("Логин"),
        "whatsOnYourMind":
            MessageLookupByLibrary.simpleMessage("О чем думаешь?"),
        "womanPointingToABoardWithNotes": MessageLookupByLibrary.simpleMessage(
            "Женщина указывает на доску с записками")
      };
}
