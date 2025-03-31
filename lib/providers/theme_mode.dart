import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'prefs.dart';

part 'theme_mode.g.dart';

@Riverpod(keepAlive: true)
class CurrentThemeMode extends _$CurrentThemeMode {
  @override
  ThemeMode build() {
    final prefs = ref.watch(sharedPrefsProvider).requireValue;
    final checkedThemeModeString = prefs.getString('themeMode');
    final themeMode = ThemeMode.values.firstWhere(
      (e) => e.name == checkedThemeModeString,
      orElse: () => ThemeMode.dark,
    );

    return themeMode;
  }

  void toggle() {
    final prefs = ref.read(sharedPrefsProvider).requireValue;
    final newThemeMode = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;

    prefs.setString('themeMode', newThemeMode.name);
    state = newThemeMode;
  }
}
