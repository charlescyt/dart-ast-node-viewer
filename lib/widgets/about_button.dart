import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../providers/package_info.dart';
import '../utils/app.dart';

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
        applicationName: App.title,
        applicationIcon: Image.asset(App.logoPath, width: 48.0, height: 48.0),
        applicationVersion: 'v${packageInfo.version}',
        applicationLegalese: '© ${DateTime.now().year}\n${App.author}\n${App.license}',
        children: [
          const SizedBox(height: 24.0),
          const Text('Built with Flutter ${App.flutterChannel} ${App.flutterVersion}.'),
        ],
      ),
    );
  }
}
