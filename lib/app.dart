import 'package:flutter/material.dart';

import 'pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: FlexThemeData.dark(
      //   scheme: FlexScheme.aquaBlue,
      //   surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      //   blendLevel: 2,
      //   subThemesData: const FlexSubThemesData(
      //     blendOnLevel: 10,
      //     blendTextTheme: true,
      //     useTextTheme: true,
      //     useM2StyleDividerInM3: true,
      //     defaultRadius: 12,
      //     elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
      //     elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
      //     outlinedButtonOutlineSchemeColor: SchemeColor.primary,
      //     toggleButtonsBorderSchemeColor: SchemeColor.primary,
      //     segmentedButtonSchemeColor: SchemeColor.primary,
      //     segmentedButtonBorderSchemeColor: SchemeColor.primary,
      //     unselectedToggleIsColored: true,
      //     sliderValueTinted: true,
      //     inputDecoratorSchemeColor: SchemeColor.primary,
      //     inputDecoratorBackgroundAlpha: 43,
      //     inputDecoratorUnfocusedHasBorder: false,
      //     inputDecoratorFocusedBorderWidth: 1,
      //     inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
      //     fabUseShape: true,
      //     fabAlwaysCircular: true,
      //     fabSchemeColor: SchemeColor.tertiary,
      //     popupMenuRadius: 8,
      //     popupMenuElevation: 3,
      //     alignedDropdown: true,
      //     useInputDecoratorThemeInDialogs: true,
      //     drawerIndicatorRadius: 12,
      //     drawerIndicatorSchemeColor: SchemeColor.primary,
      //     bottomNavigationBarMutedUnselectedLabel: false,
      //     bottomNavigationBarMutedUnselectedIcon: false,
      //     menuRadius: 8,
      //     menuElevation: 3,
      //     menuBarRadius: 0,
      //     menuBarElevation: 2,
      //     menuBarShadowColor: Color(0x00000000),
      //     navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
      //     navigationBarMutedUnselectedLabel: false,
      //     navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
      //     navigationBarMutedUnselectedIcon: false,
      //     navigationBarIndicatorSchemeColor: SchemeColor.primary,
      //     navigationBarIndicatorOpacity: 1,
      //     navigationBarIndicatorRadius: 12,
      //     navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
      //     navigationRailMutedUnselectedLabel: false,
      //     navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
      //     navigationRailMutedUnselectedIcon: false,
      //     navigationRailIndicatorSchemeColor: SchemeColor.primary,
      //     navigationRailIndicatorOpacity: 1,
      //     navigationRailIndicatorRadius: 12,
      //     navigationRailBackgroundSchemeColor: SchemeColor.surface,
      //   ),
      //   keyColors: const FlexKeyColors(
      //     useSecondary: true,
      //     useTertiary: true,
      //   ),
      //   tones: FlexTones.jolly(Brightness.dark),
      //   visualDensity: FlexColorScheme.comfortablePlatformDensity,
      //   useMaterial3: true,
      //   fontFamily: 'Lato',
      // ),
      // flex_color_scheme v7.3.1 is not compatible with flutter v3.22.0
      theme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
        fontFamily: 'Lato',
      ),
      home: const HomePage(),
    );
  }
}
