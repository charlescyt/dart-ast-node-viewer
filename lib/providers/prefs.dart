import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'prefs.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferencesWithCache> sharedPrefs(Ref ref) {
  return SharedPreferencesWithCache.create(cacheOptions: const SharedPreferencesWithCacheOptions());
}
