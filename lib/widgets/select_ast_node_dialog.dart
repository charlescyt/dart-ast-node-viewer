import 'package:flutter/material.dart';

import '../models/ast_node_kind.dart';

class SelectAstNodeDialog extends StatefulWidget {
  const SelectAstNodeDialog({super.key});

  static Future<String?> show({required BuildContext context}) {
    return showDialog<String>(
      context: context,
      builder: (context) => const SelectAstNodeDialog(),
    );
  }

  @override
  State<SelectAstNodeDialog> createState() => _SelectAstNodeDialogState();
}

class _SelectAstNodeDialogState extends State<SelectAstNodeDialog> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 48.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: NavigationToolbar(
                middle: Text(
                  'Select an AST node',
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
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: AstNodeKind.values.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300.0,
                mainAxisExtent: 100.0,
              ),
              itemBuilder: (context, index) {
                final kind = AstNodeKind.values[index];
                return Opacity(
                  opacity: kind.hasExample ? 1.0 : 0.5,
                  child: Card.outlined(
                    child: InkWell(
                      onTap: kind.hasExample ? () => Navigator.of(context).pop(kind.example) : null,
                      child: Center(
                        child: Text(kind.name.capitalize()),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
