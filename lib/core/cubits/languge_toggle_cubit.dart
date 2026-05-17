import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageToggleCubit extends Cubit<Locale> {
  LanguageToggleCubit() : super(const Locale('en'));

  void languageToggle(Locale locale) {
    emit(locale);
  }
}
