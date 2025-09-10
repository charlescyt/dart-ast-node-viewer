import 'dart:ui';

import 'package:flutter/services.dart' show FlutterVersion;

abstract class App {
  static const String title = 'Dart AST Node Viewer';
  static const Color primaryColor = Color(0xFF40C380);
  static const String fontFamily = 'Lato';
  static const String codeFontFamily = 'JetBrains Mono';
  static const String logoPath = 'assets/images/logo.png';
  static const String author = 'Charles Tsang';
  static const String license = 'MIT License';
  static const String githubUrl = 'https://github.com/charlescyt/dart-ast-node-viewer';
  static const String flutterVersion = FlutterVersion.version ?? '';
  static const String flutterChannel = FlutterVersion.channel ?? '';
}
