// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prefs.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sharedPrefs)
const sharedPrefsProvider = SharedPrefsProvider._();

final class SharedPrefsProvider
    extends
        $FunctionalProvider<
          AsyncValue<SharedPreferencesWithCache>,
          SharedPreferencesWithCache,
          FutureOr<SharedPreferencesWithCache>
        >
    with $FutureModifier<SharedPreferencesWithCache>, $FutureProvider<SharedPreferencesWithCache> {
  const SharedPrefsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPrefsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPrefsHash();

  @$internal
  @override
  $FutureProviderElement<SharedPreferencesWithCache> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SharedPreferencesWithCache> create(Ref ref) {
    return sharedPrefs(ref);
  }
}

String _$sharedPrefsHash() => r'8e655e7123c68d1b0957b25eaf645157350051a6';
