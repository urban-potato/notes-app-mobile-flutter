// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(notesNumber) => "${notesNumber} notes";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "allNotes": MessageLookupByLibrary.simpleMessage("All notes"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "dontHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Don\'\'t have an account?"),
        "incorrectPassword":
            MessageLookupByLibrary.simpleMessage("Incorrect password"),
        "incorrectUsername":
            MessageLookupByLibrary.simpleMessage("Incorrect username"),
        "letsWriteWhatsOnYourMind": MessageLookupByLibrary.simpleMessage(
            "Let\'\'s write what\'\'s on your\nmind!"),
        "logIn": MessageLookupByLibrary.simpleMessage("Log in"),
        "newNote": MessageLookupByLibrary.simpleMessage("New Note"),
        "notesnumberNotes": m0,
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign in"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
        "title": MessageLookupByLibrary.simpleMessage("Title"),
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "whatsOnYourMind":
            MessageLookupByLibrary.simpleMessage("What\'\'s on your\nmind?"),
        "womanPointingToABoardWithNotes": MessageLookupByLibrary.simpleMessage(
            "Woman pointing to a board with notes")
      };
}
