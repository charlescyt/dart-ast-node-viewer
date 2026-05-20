import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remix_icons_flutter/remixicon_ids.dart';

import '../providers/theme_mode.dart';

class ToggleThemeModeButton extends ConsumerWidget {
  const ToggleThemeModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(currentThemeModeProvider);

    return IconButton(
      tooltip: 'Toggle Theme',
      icon: themeMode == ThemeMode.dark ? const Icon(RemixIcon.moonLine) : const Icon(RemixIcon.sunLine),
      onPressed: () => ref.read(currentThemeModeProvider.notifier).toggle(),
    );
  }
}
