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

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Create your exclusive account`
  String get create_exclusive_account {
    return Intl.message(
      'Create your exclusive account',
      name: 'create_exclusive_account',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get continue_with_google {
    return Intl.message(
      'Continue with Google',
      name: 'continue_with_google',
      desc: '',
      args: [],
    );
  }

  /// `OR REGISTER WITH EMAIL`
  String get or_register_with_email {
    return Intl.message(
      'OR REGISTER WITH EMAIL',
      name: 'or_register_with_email',
      desc: '',
      args: [],
    );
  }

  /// `FULL NAME`
  String get full_name {
    return Intl.message('FULL NAME', name: 'full_name', desc: '', args: []);
  }

  /// `Jane Doe`
  String get full_name_hint {
    return Intl.message('Jane Doe', name: 'full_name_hint', desc: '', args: []);
  }

  /// `EMAIL`
  String get email {
    return Intl.message('EMAIL', name: 'email', desc: '', args: []);
  }

  /// `jane@example.com`
  String get email_hint {
    return Intl.message(
      'jane@example.com',
      name: 'email_hint',
      desc: '',
      args: [],
    );
  }

  /// `PASSWORD`
  String get password {
    return Intl.message('PASSWORD', name: 'password', desc: '', args: []);
  }

  /// `........`
  String get password_hint {
    return Intl.message('........', name: 'password_hint', desc: '', args: []);
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get already_have_account {
    return Intl.message(
      'Already have an account?',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Verify Identity`
  String get verify_identity {
    return Intl.message(
      'Verify Identity',
      name: 'verify_identity',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 4-digit code sent to your email`
  String get verify_identity_desc {
    return Intl.message(
      'Enter the 4-digit code sent to your email',
      name: 'verify_identity_desc',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `Didn't receive the code?`
  String get didnt_receive_code {
    return Intl.message(
      'Didn\'t receive the code?',
      name: 'didnt_receive_code',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message('Resend', name: 'resend', desc: '', args: []);
  }

  /// `Back to login`
  String get back_to_login {
    return Intl.message(
      'Back to login',
      name: 'back_to_login',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgot_password {
    return Intl.message(
      'Forgot Password',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email to receive a recovery code. We'll help you get back into your account.`
  String get forgot_password_desc {
    return Intl.message(
      'Enter your email to receive a recovery code. We\'ll help you get back into your account.',
      name: 'forgot_password_desc',
      desc: '',
      args: [],
    );
  }

  /// `EMAIL ADDRESS`
  String get email_address {
    return Intl.message(
      'EMAIL ADDRESS',
      name: 'email_address',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get send_code {
    return Intl.message('Send Code', name: 'send_code', desc: '', args: []);
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a new password to secure your account.`
  String get new_password_desc {
    return Intl.message(
      'Please enter a new password to secure your account.',
      name: 'new_password_desc',
      desc: '',
      args: [],
    );
  }

  /// `Must be at least 8 characters long and include a number or symbol.`
  String get must_be_at_least_8_chars {
    return Intl.message(
      'Must be at least 8 characters long and include a number or symbol.',
      name: 'must_be_at_least_8_chars',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Password Reset Successful`
  String get password_reset_successful {
    return Intl.message(
      'Password Reset Successful',
      name: 'password_reset_successful',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been securely updated. You can now access your account with your new credentials.`
  String get password_reset_successful_desc {
    return Intl.message(
      'Your password has been securely updated. You can now access your account with your new credentials.',
      name: 'password_reset_successful_desc',
      desc: '',
      args: [],
    );
  }

  /// `Need further assistance?`
  String get need_further_assistance {
    return Intl.message(
      'Need further assistance?',
      name: 'need_further_assistance',
      desc: '',
      args: [],
    );
  }

  /// `Contact Support`
  String get contact_support {
    return Intl.message(
      'Contact Support',
      name: 'contact_support',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcome_back {
    return Intl.message(
      'Welcome Back',
      name: 'welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account`
  String get login_to_your_account {
    return Intl.message(
      'Login to your account',
      name: 'login_to_your_account',
      desc: '',
      args: [],
    );
  }

  /// `OR LOGIN WITH EMAIL`
  String get or_login_with_email {
    return Intl.message(
      'OR LOGIN WITH EMAIL',
      name: 'or_login_with_email',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dont_have_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dont_have_account',
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
