import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../themes/code_theme.dart';
import 'prefs.dart';

part 'code_theme.g.dart';

@riverpod
class CurrentLightCodeTheme extends _$CurrentLightCodeTheme {
  @override
  LightCodeTheme build() {
    final prefs = ref.watch(sharedPrefsProvider).requireValue;
    final cachedTheme = prefs.getString('lightCodeTheme');

    if (cachedTheme == null) {
      return LightCodeTheme.defaultTheme;
    }

    return LightCodeTheme.values.firstWhere(
      (e) => e.name == cachedTheme,
      orElse: () => LightCodeTheme.defaultTheme,
    );
  }

  void set(LightCodeTheme theme) {
    final prefs = ref.watch(sharedPrefsProvider).requireValue;
    prefs.setString('lightCodeTheme', theme.name);
    state = theme;
  }
}

@riverpod
class CurrentDarkCodeTheme extends _$CurrentDarkCodeTheme {
  @override
  DarkCodeTheme build() {
    final prefs = ref.watch(sharedPrefsProvider).requireValue;
    final cachedTheme = prefs.getString('darkCodeTheme');

    if (cachedTheme == null) {
      return DarkCodeTheme.defaultTheme;
    }

    return DarkCodeTheme.values.firstWhere(
      (e) => e.name == cachedTheme,
      orElse: () => DarkCodeTheme.defaultTheme,
    );
  }

  void set(DarkCodeTheme theme) {
    final prefs = ref.watch(sharedPrefsProvider).requireValue;
    prefs.setString('darkCodeTheme', theme.name);
    state = theme;
  }
}
