import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:url_launcher/link.dart';

class GithubLinkButton extends StatelessWidget {
  const GithubLinkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Link(
      target: LinkTarget.blank,
      uri: Uri.parse('https://github.com/charlescyt/dart-ast-node-viewer'),
      builder: (context, followLink) {
        return IconButton(
          tooltip: 'GitHub',
          icon: const Icon(LucideIcons.github),
          onPressed: followLink,
        );
      },
    );
  }
}
