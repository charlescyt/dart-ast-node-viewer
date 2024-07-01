import 'package:flutter/material.dart';

ThemeData generateTheme() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.dark,
  );

  return ThemeData(
    colorScheme: colorScheme,
    fontFamily: 'Lato',
    cardTheme: _cardTheme(),
    listTileTheme: _listTileTheme(colorScheme),
  );
}

ShapeBorder get _shape => const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    );

CardTheme _cardTheme() {
  return CardTheme(
    clipBehavior: Clip.antiAlias,
    shape: _shape,
  );
}

ListTileThemeData _listTileTheme(ColorScheme colorScheme) {
  return ListTileThemeData(
    selectedTileColor: colorScheme.primaryContainer,
  );
}
