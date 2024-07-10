import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: generateTheme(),
      home: const HomePage(),
    );
  }
}
