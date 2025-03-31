import 'package:flutter/material.dart';

import '../themes/code_theme.dart';

typedef SelectCodeThemeDialogResult = ({LightCodeTheme lightTheme, DarkCodeTheme darkTheme});

class SelectCodeThemeDialog extends StatefulWidget {
  const SelectCodeThemeDialog({
    super.key,
    required this.lightTheme,
    required this.darkTheme,
  });

  final LightCodeTheme lightTheme;
  final DarkCodeTheme darkTheme;

  static Future<SelectCodeThemeDialogResult?> show(
    BuildContext context, {
    required LightCodeTheme lightTheme,
    required DarkCodeTheme darkTheme,
  }) {
    return showDialog<SelectCodeThemeDialogResult>(
      context: context,
      builder: (context) => SelectCodeThemeDialog(
        lightTheme: lightTheme,
        darkTheme: darkTheme,
      ),
    );
  }

  @override
  State<SelectCodeThemeDialog> createState() => _SelectCodeThemeDialogState();
}

class _SelectCodeThemeDialogState extends State<SelectCodeThemeDialog> {
  late LightCodeTheme _lightTheme = widget.lightTheme;
  late DarkCodeTheme _darkTheme = widget.darkTheme;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 48.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: NavigationToolbar(
                  middle: Text(
                    'Select Code Theme',
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleLarge,
                  ),
                  trailing: CloseButton(
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
            ),
            const Divider(height: 1.0),
            Flexible(
              child: Material(
                type: MaterialType.transparency,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: LightCodeTheme.values.length,
                        itemBuilder: (context, index) {
                          final theme = LightCodeTheme.values[index];
                          return ListTile(
                            title: Text(theme.label),
                            selected: _lightTheme == theme,
                            onTap: () {
                              setState(() => _lightTheme = theme);
                            },
                          );
                        },
                      ),
                    ),
                    const VerticalDivider(width: 1.0),
                    Expanded(
                      child: ListView.builder(
                        itemCount: DarkCodeTheme.values.length,
                        itemBuilder: (context, index) {
                          final theme = DarkCodeTheme.values[index];
                          return ListTile(
                            title: Text(theme.label),
                            selected: _darkTheme == theme,
                            onTap: () {
                              setState(() => _darkTheme = theme);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 1.0),
            const SizedBox(height: 8.0),
            OverflowBar(
              spacing: 8.0,
              overflowSpacing: 8.0,
              overflowAlignment: OverflowBarAlignment.center,
              children: [
                FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop((lightTheme: _lightTheme, darkTheme: _darkTheme));
                  },
                  child: const Text('Confirm'),
                ),
                OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
