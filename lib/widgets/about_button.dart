import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../providers/package_info.dart';
import '../utils/app.dart';

class AboutButton extends ConsumerWidget {
  const AboutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.watch(packageInfoProvider).requireValue;
    return IconButton(
      tooltip: 'About',
      icon: const FaIcon(FontAwesomeIcons.circleInfo),
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
