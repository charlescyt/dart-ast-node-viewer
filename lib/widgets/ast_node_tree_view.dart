import 'package:analyzer/dart/ast/ast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';

import '../models/tree_node.dart';
import '../utils/formatting.dart';
import 'app_decorated_box.dart';

class AstNodeTreeView extends StatefulWidget {
  const AstNodeTreeView({
    super.key,
    required this.roots,
    this.selected,
    required this.onNodeChanged,
  });

  final Iterable<TreeNode<AstNode>> roots;
  final AstNode? selected;
  final void Function(AstNode node) onNodeChanged;

  @override
  State<AstNodeTreeView> createState() => _AstNodeTreeViewState();
}

class _AstNodeTreeViewState extends State<AstNodeTreeView> {
  late final TreeController<TreeNode<AstNode>> _treeController;

  @override
  void initState() {
    super.initState();
    _treeController = TreeController<TreeNode<AstNode>>(
      roots: widget.roots,
      childrenProvider: (node) => node.children,
      defaultExpansionState: true,
    );
  }

  @override
  void didUpdateWidget(covariant AstNodeTreeView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.roots != oldWidget.roots) {
      _treeController.roots = widget.roots;
    }
  }

  @override
  void dispose() {
    _treeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppDecoratedBox(
      child: AnimatedTreeView<TreeNode<AstNode>>(
        treeController: _treeController,
        nodeBuilder: (context, entry) {
          final astNode = entry.node.value;
          return Ink(
            color: widget.selected == astNode ? theme.colorScheme.primaryContainer : null,
            child: InkWell(
              onTap: () {
                widget.onNodeChanged(astNode);
              },
              child: TreeIndentation(
                entry: entry,
                guide: IndentGuide.connectingLines(
                  connectBranches: false,
                  indent: 24,
                  color: theme.dividerColor,
                ),
                child: Text(
                  formatAstNodeRuntimeType(astNode),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
