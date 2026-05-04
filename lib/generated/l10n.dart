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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Curated Elegance`
  String get onboarding_1_title {
    return Intl.message(
      'Curated Elegance',
      name: 'onboarding_1_title',
      desc: '',
      args: [],
    );
  }

  /// `Discover a world of refined taste. We\nhandpick exclusive collections tailored to\nyour discerning lifestyle.`
  String get onboarding_1_description {
    return Intl.message(
      'Discover a world of refined taste. We\nhandpick exclusive collections tailored to\nyour discerning lifestyle.',
      name: 'onboarding_1_description',
      desc: '',
      args: [],
    );
  }

  /// `Seamless Experience`
  String get onboarding_2_title {
    return Intl.message(
      'Seamless Experience',
      name: 'onboarding_2_title',
      desc: '',
      args: [],
    );
  }

  /// `Your exclusive journey begins now\nStep into a world of curated\nelegance designed perfectly for you..`
  String get onboarding_2_description {
    return Intl.message(
      'Your exclusive journey begins now\nStep into a world of curated\nelegance designed perfectly for you..',
      name: 'onboarding_2_description',
      desc: '',
      args: [],
    );
  }

  /// `Exclusive Collections`
  String get onboarding_3_title {
    return Intl.message(
      'Exclusive Collections',
      name: 'onboarding_3_title',
      desc: '',
      args: [],
    );
  }

  /// `Gain early access to limited edition pieces\ncrafted with uncompromising quality..`
  String get onboarding_3_description {
    return Intl.message(
      'Gain early access to limited edition pieces\ncrafted with uncompromising quality..',
      name: 'onboarding_3_description',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Get Started`
  String get get_started {
    return Intl.message('Get Started', name: 'get_started', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
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
