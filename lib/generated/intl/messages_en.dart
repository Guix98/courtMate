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

  static String m0(probability) => "Clouds:\n${probability}%";

  static String m1(name, court, date) =>
      "Are you sure to delete ${name}\'s reservation, court \"${court}\" at ${date}?";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "appTitle": MessageLookupByLibrary.simpleMessage("CourtMate"),
        "clouds": m0,
        "court": MessageLookupByLibrary.simpleMessage("Court"),
        "deleteConfirmation": m1,
        "hour": MessageLookupByLibrary.simpleMessage("Hour"),
        "newReservation":
            MessageLookupByLibrary.simpleMessage("New Reservation"),
        "nextReservation":
            MessageLookupByLibrary.simpleMessage("Next reservation: "),
        "onlyThree": MessageLookupByLibrary.simpleMessage(
            "Only three reservations per day for each court permited"),
        "selectCourt": MessageLookupByLibrary.simpleMessage("Select a court"),
        "upcomingReservations":
            MessageLookupByLibrary.simpleMessage("Upcoming reservations: "),
        "username": MessageLookupByLibrary.simpleMessage("Username: "),
        "validatorNameEmpty":
            MessageLookupByLibrary.simpleMessage("Name can not be empty"),
        "validatorNameLength": MessageLookupByLibrary.simpleMessage(
            "Name must be at least 2 characters")
      };
}
