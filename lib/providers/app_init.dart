import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'prefs.dart';

part 'app_init.g.dart';

@riverpod
Future<void> appInit(Ref ref) async {
  await ref.watch(sharedPrefsProvider.future);
}
