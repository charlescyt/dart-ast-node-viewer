import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../providers/theme_mode.dart';

class ToggleThemeModeButton extends ConsumerWidget {
  const ToggleThemeModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(currentThemeModeProvider);

    return IconButton(
      tooltip: 'Toggle Theme',
      icon: themeMode == ThemeMode.dark //
          ? const FaIcon(FontAwesomeIcons.moon)
          : const FaIcon(FontAwesomeIcons.sun),
      onPressed: () => ref.read(currentThemeModeProvider.notifier).toggle(),
    );
  }
}
