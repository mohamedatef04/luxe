import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeToggleCubit extends Cubit<ThemeData> {
  ThemeToggleCubit() : super(ThemeData.light());

  void toggleTheme(ThemeData theme) {
    emit(theme);
  }
}
