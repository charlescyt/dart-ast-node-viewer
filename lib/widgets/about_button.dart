import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../providers/package_info.dart';

class AboutButton extends ConsumerWidget {
  const AboutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.watch(packageInfoProvider).requireValue;
    return IconButton(
      tooltip: 'About',
      icon: const Icon(LucideIcons.info),
      onPressed: () => showAboutDialog(
        context: context,
        applicationName: 'Dart AST Node Viewer',
        applicationVersion: 'v${packageInfo.version}',
      ),
    );
  }
}
