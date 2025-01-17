import 'package:analyzer/dart/analysis/results.dart' show ParseStringResult;
import 'package:analyzer/dart/ast/ast.dart' show AstNode;
import 'package:analyzer/error/error.dart' show AnalysisError;
import 'package:analyzer/source/line_info.dart' show LineInfo;
import 'package:flutter/material.dart';
import 'package:re_editor/re_editor.dart';

import '../models/tree_node.dart';
import '../utils/utils.dart';
import '../widgets/analysis_error_list_view.dart';
import '../widgets/ast_node_tree_view.dart';
import '../widgets/code_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _content = demoCode;
  late final CodeLineEditingController _controller;
  AstNode? _selectedAstNode;
  AnalysisError? _selectedError;
  late ParseStringResult _parsedResult;
  late TreeNode<AstNode> _treeNode;

  @override
  void initState() {
    super.initState();
    _controller = CodeLineEditingController.fromText(_content);
    _parsedResult = parseCode(_content);
    _treeNode = convertParseStringResultToTreeNode(_parsedResult);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onContentChanged(String value) {
    if (value == _content) return;

    setState(() {
      _content = value;
      _parsedResult = parseCode(_content);
      _treeNode = convertParseStringResultToTreeNode(_parsedResult);
      _selectedAstNode = null;
      _selectedError = null;
    });
  }

  void _onAstNodeChanged({
    required AstNode? node,
    required LineInfo lineInfo,
  }) {
    if (_selectedAstNode == node) return;

    setState(() {
      _selectedAstNode = node;

      if (node == null) {
        _controller.selection = const CodeLineSelection.zero();
      } else {
        _controller.selection = getCodeLineSelectionFromAstNode(
          node: node,
          lineInfo: lineInfo,
        );
      }
    });
  }

  void _onAnalysisErrorChanged({
    required AnalysisError? error,
    required LineInfo lineInfo,
  }) {
    if (_selectedError == error) return;

    setState(() {
      _selectedError = error;

      if (error == null) {
        _controller.selection = const CodeLineSelection.zero();
      } else {
        _controller.selection = getCodeLineSelectionFromAnalysisError(
          error: error,
          lineInfo: lineInfo,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: CodeField(
                controller: _controller,
                onContentChanged: _onContentChanged,
              ),
            ),
            const SizedBox(width: 8),
            if (_parsedResult.errors.isEmpty)
              Expanded(
                child: AstNodeTreeView(
                  roots: [_treeNode],
                  selected: _selectedAstNode,
                  onNodeChanged: (node) {
                    _onAstNodeChanged(
                      node: node,
                      lineInfo: _parsedResult.lineInfo,
                    );
                  },
                ),
              )
            else
              Expanded(
                child: AnalysisErrorListView(
                  errors: _parsedResult.errors,
                  selectedError: _selectedError,
                  onErrorSelected: (error) {
                    _onAnalysisErrorChanged(
                      error: error,
                      lineInfo: _parsedResult.lineInfo,
                    );
                  },
                ),
              ),
            // const SizedBox(width: 8),
            // if (_selectedAstNode case final astNode?)
            //   Expanded(
            //     child: AstNodeDetailsView(astNode: astNode),
            //   )
            // else
            //   const Expanded(
            //     child: AppDecoratedBox(
            //       child: Center(
            //         child: Text('Select an AST node'),
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}

const String demoCode = '''
void main() {
  print('Hello, World!');
}
''';
