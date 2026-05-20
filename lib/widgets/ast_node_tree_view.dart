import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

import '../utils/utils.dart';
import 'app_decorated_box.dart';

class AstNodeTreeView extends StatefulWidget {
  const AstNodeTreeView({
    super.key,
    required this.parseStringResult,
    required this.onNodeChanged,
    this.selected,
  });

  final ParseStringResult parseStringResult;
  final void Function(AstNode node) onNodeChanged;
  final AstNode? selected;

  @override
  State<AstNodeTreeView> createState() => AstNodeTreeViewState();
}

class AstNodeTreeViewState extends State<AstNodeTreeView> {
  late final TreeViewController _treeViewController;
  late final ScrollController _verticalController;
  late final ScrollController _horizontalController;
  late TreeViewNode<AstNode> _root;

  @override
  void initState() {
    super.initState();
    _treeViewController = TreeViewController();
    _verticalController = ScrollController();
    _horizontalController = ScrollController();
    _root = convertParseStringResultToTreeNode(widget.parseStringResult);
  }

  @override
  void didUpdateWidget(covariant AstNodeTreeView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.parseStringResult != oldWidget.parseStringResult) {
      _root = convertParseStringResultToTreeNode(widget.parseStringResult);
    }
  }

  @override
  void dispose() {
    _verticalController.dispose();
    _horizontalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: Center(
        child: AppDecoratedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Scrollbar(
              controller: _verticalController,
              thumbVisibility: true,
              child: Scrollbar(
                controller: _horizontalController,
                thumbVisibility: true,
                child: TreeView<AstNode>(
                  tree: [_root],
                  controller: _treeViewController,
                  indentation: TreeViewIndentationType.none,
                  verticalDetails: ScrollableDetails.vertical(controller: _verticalController),
                  horizontalDetails: ScrollableDetails.horizontal(controller: _horizontalController),
                  treeNodeBuilder: _treeNodeBuilder,
                  treeRowBuilder: _treeRowBuilder,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _treeNodeBuilder(BuildContext context, TreeViewNode<AstNode> node, AnimationStyle toggleAnimationStyle) {
    return Row(
      children: [
        SizedBox(width: 16.0 * node.depth!),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(getAstNodeTypeName(node.content)),
        ),
      ],
    );
  }

  TreeRow _treeRowBuilder(TreeViewNode<AstNode> node) {
    final theme = Theme.of(context);
    final isSelected = widget.selected == node.content;

    return TreeRow(
      extent: const FixedTreeRowExtent(24.0),
      recognizerFactories: _getTapRecognizer(node),
      backgroundDecoration: isSelected
          ? TreeRowDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              color: theme.colorScheme.primaryContainer,
            )
          : null,
    );
  }

  Map<Type, GestureRecognizerFactory> _getTapRecognizer(
    TreeViewNode<AstNode> node,
  ) {
    return <Type, GestureRecognizerFactory>{
      TapGestureRecognizer: GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
        TapGestureRecognizer.new,
        (TapGestureRecognizer t) => t.onTap = () {
          widget.onNodeChanged(node.content);
        },
      ),
    };
  }
}
