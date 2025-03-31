import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'prefs.dart';

part 'theme_mode.g.dart';

@Riverpod(keepAlive: true)
class CurrentThemeMode extends _$CurrentThemeMode {
  @override
  ThemeMode build() {
    final prefs = ref.watch(sharedPrefsProvider).requireValue;
    final cachedThemeModeString = prefs.getString('themeMode');

    if (cachedThemeModeString == null) {
      return ThemeMode.dark;
    }

    return ThemeMode.values.firstWhere(
      (e) => e.name == cachedThemeModeString,
      orElse: () => ThemeMode.dark,
    );
  }

  void toggle() {
    final prefs = ref.read(sharedPrefsProvider).requireValue;
    final newThemeMode = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;

    prefs.setString('themeMode', newThemeMode.name);
    state = newThemeMode;
  }
}
