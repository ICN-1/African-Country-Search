import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../states/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitialState());

  void getInitialTheme() {
    final ThemeMode appTheme = ThemeMode.system;
    emit(CurrentThemeState(currentTheme: appTheme));
  }

  void toggleTheme() {
    if (state is CurrentThemeState) {
      final currentTheme = (state as CurrentThemeState).currentTheme;
      final newTheme = currentTheme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
      emit(CurrentThemeState(currentTheme: newTheme));
    }
  }
}
