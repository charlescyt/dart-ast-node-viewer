import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../providers/theme_mode.dart';

class ToggleThemeModeButton extends ConsumerWidget {
  const ToggleThemeModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(currentThemeModeProvider);

    return IconButton(
      tooltip: 'Toggle Theme',
      icon: themeMode == ThemeMode.dark //
          ? const Icon(LucideIcons.moon)
          : const Icon(LucideIcons.sun),
      onPressed: () => ref.read(currentThemeModeProvider.notifier).toggle(),
    );
  }
}
