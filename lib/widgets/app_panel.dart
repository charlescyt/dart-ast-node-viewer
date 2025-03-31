import 'package:flutter/material.dart';

import 'app_decorated_box.dart';

class AppPanel extends StatelessWidget {
  const AppPanel({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
    required this.content,
  });

  final Widget title;
  final Widget? leading;
  final Widget? trailing;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return AppDecoratedBox(
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 48.0),
            child: Row(
              children: [
                if (leading != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: leading,
                  ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: DefaultTextStyle.merge(
                      style: textTheme.titleLarge!.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                      child: title,
                    ),
                  ),
                ),
                if (trailing != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: trailing,
                  ),
              ],
            ),
          ),
          const Divider(height: 1.0),
          Expanded(child: content),
        ],
      ),
    );
  }
}
