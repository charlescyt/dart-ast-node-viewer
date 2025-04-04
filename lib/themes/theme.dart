import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final class AppTheme {
  const AppTheme();

  ThemeData get light {
    final baseTheme = FlexThemeData.light(
      colors: FlexSchemeColor.from(
        primary: const Color(0xFF40C380),
        brightness: Brightness.light,
      ),
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 1,
      subThemesData: const FlexSubThemesData(
        interactionEffects: false,
        tintedDisabledControls: false,
        blendOnLevel: 8,
        useM2StyleDividerInM3: true,
        adaptiveAppBarScrollUnderOff: FlexAdaptive.all(),
        defaultRadius: 8.0,
        elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
        elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
        outlinedButtonOutlineSchemeColor: SchemeColor.primary,
        toggleButtonsBorderSchemeColor: SchemeColor.primary,
        segmentedButtonSchemeColor: SchemeColor.primary,
        segmentedButtonBorderSchemeColor: SchemeColor.primary,
        unselectedToggleIsColored: true,
        sliderValueTinted: true,
        inputDecoratorSchemeColor: SchemeColor.primary,
        inputDecoratorIsFilled: true,
        inputDecoratorBackgroundAlpha: 31,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        inputDecoratorUnfocusedHasBorder: false,
        inputDecoratorFocusedBorderWidth: 1.0,
        inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
        fabUseShape: true,
        fabAlwaysCircular: true,
        fabSchemeColor: SchemeColor.tertiary,
        popupMenuRadius: 8.0,
        popupMenuElevation: 3.0,
        alignedDropdown: true,
        tooltipWaitDuration: Duration(milliseconds: 500),
        drawerIndicatorRadius: 12.0,
        drawerIndicatorSchemeColor: SchemeColor.primary,
        bottomNavigationBarMutedUnselectedLabel: false,
        bottomNavigationBarMutedUnselectedIcon: false,
        menuRadius: 8.0,
        menuElevation: 3.0,
        menuBarRadius: 0.0,
        menuBarElevation: 2.0,
        menuBarShadowColor: Color(0x00000000),
        searchBarElevation: 1.0,
        searchViewElevation: 1.0,
        searchUseGlobalShape: true,
        navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
        navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
        navigationBarIndicatorSchemeColor: SchemeColor.primary,
        navigationBarIndicatorRadius: 12.0,
        navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
        navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
        navigationRailUseIndicator: true,
        navigationRailIndicatorSchemeColor: SchemeColor.primary,
        navigationRailIndicatorOpacity: 1.00,
        navigationRailIndicatorRadius: 12.0,
        navigationRailBackgroundSchemeColor: SchemeColor.surface,
        navigationRailLabelType: NavigationRailLabelType.all,
      ),
      keyColors: const FlexKeyColors(
        useSecondary: true,
        useTertiary: true,
        keepPrimary: true,
      ),
      tones: FlexSchemeVariant.jolly.tones(Brightness.light),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      fontFamily: 'Lato',
    );

    return baseTheme.copyWith(
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }

  ThemeData get dark {
    final baseTheme = FlexThemeData.dark(
      colors: FlexSchemeColor.from(
        primary: const Color(0xFF40C380),
        brightness: Brightness.dark,
      ),
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 2,
      subThemesData: const FlexSubThemesData(
        interactionEffects: false,
        tintedDisabledControls: false,
        blendOnLevel: 10,
        blendOnColors: true,
        useM2StyleDividerInM3: true,
        adaptiveAppBarScrollUnderOff: FlexAdaptive.all(),
        defaultRadius: 8.0,
        elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
        elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
        outlinedButtonOutlineSchemeColor: SchemeColor.primary,
        toggleButtonsBorderSchemeColor: SchemeColor.primary,
        segmentedButtonSchemeColor: SchemeColor.primary,
        segmentedButtonBorderSchemeColor: SchemeColor.primary,
        unselectedToggleIsColored: true,
        sliderValueTinted: true,
        inputDecoratorSchemeColor: SchemeColor.primary,
        inputDecoratorIsFilled: true,
        inputDecoratorBackgroundAlpha: 43,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        inputDecoratorUnfocusedHasBorder: false,
        inputDecoratorFocusedBorderWidth: 1.0,
        inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
        fabUseShape: true,
        fabAlwaysCircular: true,
        fabSchemeColor: SchemeColor.tertiary,
        popupMenuRadius: 8.0,
        popupMenuElevation: 3.0,
        alignedDropdown: true,
        tooltipWaitDuration: Duration(milliseconds: 500),
        drawerIndicatorRadius: 12.0,
        drawerIndicatorSchemeColor: SchemeColor.primary,
        bottomNavigationBarMutedUnselectedLabel: false,
        bottomNavigationBarMutedUnselectedIcon: false,
        menuRadius: 8.0,
        menuElevation: 3.0,
        menuBarRadius: 0.0,
        menuBarElevation: 2.0,
        menuBarShadowColor: Color(0x00000000),
        searchBarElevation: 1.0,
        searchViewElevation: 1.0,
        searchUseGlobalShape: true,
        navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
        navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
        navigationBarIndicatorSchemeColor: SchemeColor.primary,
        navigationBarIndicatorRadius: 12.0,
        navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
        navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
        navigationRailUseIndicator: true,
        navigationRailIndicatorSchemeColor: SchemeColor.primary,
        navigationRailIndicatorOpacity: 1.00,
        navigationRailIndicatorRadius: 12.0,
        navigationRailBackgroundSchemeColor: SchemeColor.surface,
        navigationRailLabelType: NavigationRailLabelType.all,
      ),
      keyColors: const FlexKeyColors(
        useSecondary: true,
        useTertiary: true,
      ),
      tones: FlexSchemeVariant.jolly.tones(Brightness.dark),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      fontFamily: 'Lato',
    );

    return baseTheme.copyWith(
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
