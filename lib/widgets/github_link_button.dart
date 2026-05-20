import 'package:flutter/material.dart';
import 'package:remix_icons_flutter/remixicon_ids.dart';
import 'package:url_launcher/link.dart';

import '../utils/app.dart';

class GithubLinkButton extends StatelessWidget {
  const GithubLinkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Link(
      target: LinkTarget.blank,
      uri: Uri.parse(App.githubUrl),
      builder: (context, followLink) {
        return IconButton(
          tooltip: 'GitHub',
          icon: const Icon(RemixIcon.githubLine),
          onPressed: followLink,
        );
      },
    );
  }
}
