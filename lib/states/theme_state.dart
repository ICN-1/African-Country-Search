import 'package:flutter/material.dart';

abstract class ThemeState {}

class ThemeInitialState extends ThemeState {}

class CurrentThemeState extends ThemeState {
  final ThemeMode currentTheme;
  CurrentThemeState({required this.currentTheme});
}
