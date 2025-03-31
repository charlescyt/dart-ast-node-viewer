import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../providers/code_theme.dart';
import 'select_code_theme_dialog.dart';

class SelectCodeThemeButton extends ConsumerWidget {
  const SelectCodeThemeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      tooltip: 'Code Theme',
      icon: const Icon(LucideIcons.palette),
      onPressed: () async {
        final lightTheme = ref.read(currentLightCodeThemeProvider);
        final darkTheme = ref.read(currentDarkCodeThemeProvider);
        final result = await SelectCodeThemeDialog.show(context, lightTheme: lightTheme, darkTheme: darkTheme);

        if (result case (:final lightTheme, :final darkTheme)) {
          ref.read(currentLightCodeThemeProvider.notifier).set(lightTheme);
          ref.read(currentDarkCodeThemeProvider.notifier).set(darkTheme);
        }
      },
    );
  }
}
