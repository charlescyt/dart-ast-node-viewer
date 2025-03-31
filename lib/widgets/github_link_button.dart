import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          icon: const FaIcon(FontAwesomeIcons.github),
          onPressed: followLink,
        );
      },
    );
  }
}
