// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `CourtMate`
  String get appTitle {
    return Intl.message(
      'CourtMate',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Next reservation: `
  String get nextReservation {
    return Intl.message(
      'Next reservation: ',
      name: 'nextReservation',
      desc: '',
      args: [],
    );
  }

  /// `New Reservation`
  String get newReservation {
    return Intl.message(
      'New Reservation',
      name: 'newReservation',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to delete {name}'s reservation, court "{court}" at {date}?`
  String deleteConfirmation(String name, String court, String date) {
    return Intl.message(
      'Are you sure to delete $name\'s reservation, court "$court" at $date?',
      name: 'deleteConfirmation',
      desc: '',
      args: [name, court, date],
    );
  }

  /// `Court`
  String get court {
    return Intl.message(
      'Court',
      name: 'court',
      desc: '',
      args: [],
    );
  }

  /// `Username: `
  String get username {
    return Intl.message(
      'Username: ',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'date:' key

  /// `Hour`
  String get hour {
    return Intl.message(
      'Hour',
      name: 'hour',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Select a court`
  String get selectCourt {
    return Intl.message(
      'Select a court',
      name: 'selectCourt',
      desc: '',
      args: [],
    );
  }

  /// `Name can not be empty`
  String get validatorNameEmpty {
    return Intl.message(
      'Name can not be empty',
      name: 'validatorNameEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Name must be at least 2 characters`
  String get validatorNameLength {
    return Intl.message(
      'Name must be at least 2 characters',
      name: 'validatorNameLength',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming reservations: `
  String get upcomingReservations {
    return Intl.message(
      'Upcoming reservations: ',
      name: 'upcomingReservations',
      desc: '',
      args: [],
    );
  }

  /// `Clouds:\n{probability}%`
  String clouds(String probability) {
    return Intl.message(
      'Clouds:\n$probability%',
      name: 'clouds',
      desc: '',
      args: [probability],
    );
  }

  /// `Only three reservations per day for each court permited`
  String get onlyThree {
    return Intl.message(
      'Only three reservations per day for each court permited',
      name: 'onlyThree',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
