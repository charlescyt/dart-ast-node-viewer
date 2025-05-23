import 'package:analyzer/dart/analysis/results.dart' show ParseStringResult;
import 'package:analyzer/dart/ast/ast.dart' show AstNode;
import 'package:analyzer/dart/ast/syntactic_entity.dart';
import 'package:analyzer/error/error.dart' show AnalysisError;
import 'package:analyzer/source/line_info.dart' show LineInfo;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:re_editor/re_editor.dart';

import '../models/tree_node.dart';
import '../providers/code_theme.dart';
import '../utils/utils.dart';
import '../widgets/about_button.dart';
import '../widgets/analysis_error_list_view.dart';
import '../widgets/app_decorated_box.dart';
import '../widgets/ast_node_info_panel.dart';
import '../widgets/ast_node_tree_view.dart';
import '../widgets/code_field.dart';
import '../widgets/github_link_button.dart';
import '../widgets/select_ast_node_dialog.dart';
import '../widgets/select_code_theme_button.dart';
import '../widgets/toggle_theme_mode_button.dart';

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
  SyntacticEntity? _selectedSyntacticEntity;
  AnalysisError? _selectedError;
  late ParseStringResult _parsedResult;
  late TreeNode<AstNode> _treeNode;

  AstNode? get _selectedAstNode => switch (_selectedSyntacticEntity) {
    final AstNode node => node,
    _ => null,
  };

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
      _selectedSyntacticEntity = null;
      _selectedError = null;
    });
  }

  void _onSyntacticEntityChanged({
    required SyntacticEntity? entity,
    required LineInfo lineInfo,
  }) {
    if (_selectedSyntacticEntity == entity) return;

    setState(() {
      _selectedSyntacticEntity = entity;

      if (entity == null) {
        _controller.selection = const CodeLineSelection.zero();
      } else {
        _controller.selection = getCodeLineSelectionFromSyntacticEntity(
          entity: entity,
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

  Future<void> _onAstNodesButtonPressed() async {
    final examples = await SelectAstNodeDialog.show(context: context);

    if (!context.mounted) return;

    if (examples case final examples? when examples.isNotEmpty) {
      _onContentChanged(examples);
      _controller.text = examples;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.dividerColor;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 48.0,
        titleSpacing: 0.0,
        leading: Image.asset('assets/images/logo.png', width: 24.0, height: 24.0),
        title: const Text('Dart AST Node Viewer'),
        shape: Border(bottom: BorderSide(color: color, width: 1.0)),
        actionsPadding: const EdgeInsets.only(right: 8.0),
        actions: [
          const AboutButton(),
          const GithubLinkButton(),
          const SelectCodeThemeButton(),
          const ToggleThemeModeButton(),
          IconButton(
            tooltip: 'Ast Nodes',
            icon: const Icon(LucideIcons.squareMenu),
            onPressed: _onAstNodesButtonPressed,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 1400.0) {
              return Row(
                children: [
                  Expanded(
                    child: _buildCodeField(theme),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(child: _buildTreeView()),
                        const SizedBox(height: 8.0),
                        Expanded(child: _buildAstNodeInfoPanel()),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildCodeField(theme),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: _buildTreeView(),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: _buildAstNodeInfoPanel(),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Consumer _buildCodeField(ThemeData theme) {
    return Consumer(
      builder: (context, ref, child) {
        final lightCodeTheme = ref.watch(currentLightCodeThemeProvider);
        final darkCodeTheme = ref.watch(currentDarkCodeThemeProvider);
        return CodeField(
          controller: _controller,
          theme: theme.brightness == Brightness.light ? lightCodeTheme.value : darkCodeTheme.value,
          onContentChanged: _onContentChanged,
        );
      },
    );
  }

  Widget _buildTreeView() {
    return _parsedResult.errors.isEmpty
        ? AstNodeTreeView(
            roots: [_treeNode],
            selected: _selectedAstNode,
            onNodeChanged: (node) {
              _onSyntacticEntityChanged(
                entity: node,
                lineInfo: _parsedResult.lineInfo,
              );
            },
          )
        : AnalysisErrorListView(
            errors: _parsedResult.errors,
            selectedError: _selectedError,
            onErrorSelected: (error) {
              _onAnalysisErrorChanged(
                error: error,
                lineInfo: _parsedResult.lineInfo,
              );
            },
          );
  }

  Widget _buildAstNodeInfoPanel() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _selectedAstNode == null
          ? const AppDecoratedBox(
              child: Center(
                child: Text('Select an AST node'),
              ),
            )
          : AstNodeInfoPanel(
              key: ValueKey(_selectedSyntacticEntity.hashCode),
              node: _selectedAstNode!,
              onSyntacticEntitySelected: (entity) {
                _onSyntacticEntityChanged(
                  entity: entity,
                  lineInfo: _parsedResult.lineInfo,
                );
              },
            ),
    );
  }
}

const String demoCode = '''
void main() {
  print('Hello, World!');
}
''';
