import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pages/home_page.dart';
import 'providers/app_init.dart';
import 'providers/theme_mode.dart';
import 'themes/theme.dart';
import 'utils/app.dart';

class DartAstNodeViewer extends StatelessWidget {
  const DartAstNodeViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return _EagerInitialization(
      child: Consumer(
        builder: (context, ref, child) {
          final themeMode = ref.watch(currentThemeModeProvider);
          const appTheme = AppTheme();

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: App.title,
            theme: appTheme.light,
            darkTheme: appTheme.dark,
            themeMode: themeMode,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appInit = ref.watch(appInitProvider);

    return appInit.when(
      data: (_) => child,
      error: (error, stackTrace) => Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: Text('Oops! Something went wrong.\nError: $error'),
        ),
      ),
      loading: () => const SizedBox.shrink(),
    );
  }
}
