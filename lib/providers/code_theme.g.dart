// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_theme.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(CurrentLightCodeTheme)
const currentLightCodeThemeProvider = CurrentLightCodeThemeProvider._();

final class CurrentLightCodeThemeProvider extends $NotifierProvider<CurrentLightCodeTheme, LightCodeTheme> {
  const CurrentLightCodeThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentLightCodeThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentLightCodeThemeHash();

  @$internal
  @override
  CurrentLightCodeTheme create() => CurrentLightCodeTheme();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LightCodeTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LightCodeTheme>(value),
    );
  }
}

String _$currentLightCodeThemeHash() => r'4d63c27c9b438e82660121da7ce2464ce1fc040e';

abstract class _$CurrentLightCodeTheme extends $Notifier<LightCodeTheme> {
  LightCodeTheme build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LightCodeTheme, LightCodeTheme>;
    final element =
        ref.element
            as $ClassProviderElement<AnyNotifier<LightCodeTheme, LightCodeTheme>, LightCodeTheme, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(CurrentDarkCodeTheme)
const currentDarkCodeThemeProvider = CurrentDarkCodeThemeProvider._();

final class CurrentDarkCodeThemeProvider extends $NotifierProvider<CurrentDarkCodeTheme, DarkCodeTheme> {
  const CurrentDarkCodeThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentDarkCodeThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentDarkCodeThemeHash();

  @$internal
  @override
  CurrentDarkCodeTheme create() => CurrentDarkCodeTheme();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DarkCodeTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DarkCodeTheme>(value),
    );
  }
}

String _$currentDarkCodeThemeHash() => r'3a081e353fc9f7f030a6bb7b7e5cee7d310436d5';

abstract class _$CurrentDarkCodeTheme extends $Notifier<DarkCodeTheme> {
  DarkCodeTheme build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<DarkCodeTheme, DarkCodeTheme>;
    final element =
        ref.element
            as $ClassProviderElement<AnyNotifier<DarkCodeTheme, DarkCodeTheme>, DarkCodeTheme, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
