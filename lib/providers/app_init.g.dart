// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_init.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appInit)
const appInitProvider = AppInitProvider._();

final class AppInitProvider extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const AppInitProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appInitProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appInitHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return appInit(ref);
  }
}

String _$appInitHash() => r'5db4aff942b8d710272fce86881a6a7cc1f1829e';
