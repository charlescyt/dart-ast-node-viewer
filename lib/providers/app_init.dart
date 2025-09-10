import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package_info.dart';
import 'prefs.dart';

part 'app_init.g.dart';

@riverpod
Future<void> appInit(Ref ref) async {
  await (
    ref.watch(sharedPrefsProvider.future),
    ref.watch(packageInfoProvider.future),
  ).wait;
}
