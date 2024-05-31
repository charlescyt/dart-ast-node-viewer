import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/error.dart';
import 'package:analyzer/source/line_info.dart';
import 'package:re_editor/re_editor.dart';

import '../models/tree_node.dart';
import 'visitor.dart';

ParseStringResult parseCode(String content) {
  final result = parseString(
    content: content,
    throwIfDiagnostics: false,
  );

  return result;
}

TreeNode<AstNode> convertParseStringResultToTreeNode(ParseStringResult result) {
  final compilationUnit = result.unit;

  if (result.errors.isNotEmpty) {
    return TreeNode(compilationUnit);
  }

  final treeNode = compilationUnit.accept(const AstTreeNodeVisitor());
  if (treeNode == null) {
    return TreeNode(compilationUnit);
  }

  return treeNode;
}

/// Get [CodeLineSelection] from [AstNode]
///
/// [LineInfo] is required to calculate the line number and column number
CodeLineSelection getCodeLineSelectionFromAstNode({
  required AstNode node,
  required LineInfo lineInfo,
}) {
  return getCodeLineSelectionFromOffsetAndLength(
    offset: node.offset,
    length: node.length,
    lineInfo: lineInfo,
  );
}

/// Get [CodeLineSelection] from [AnalysisError].
///
/// [LineInfo] is required to calculate the line number and column number
CodeLineSelection getCodeLineSelectionFromAnalysisError({
  required AnalysisError error,
  required LineInfo lineInfo,
}) {
  return getCodeLineSelectionFromOffsetAndLength(
    offset: error.offset,
    length: error.length,
    lineInfo: lineInfo,
  );
}

/// Get [CodeLineSelection] from offset and length.
///
/// [LineInfo] is required to calculate the line number and column number
CodeLineSelection getCodeLineSelectionFromOffsetAndLength({
  required int offset,
  required int length,
  required LineInfo lineInfo,
}) {
  final end = offset + length;

  final startLocation = lineInfo.getLocation(offset);
  final startLine = startLocation.lineNumber - 1;
  final startColumn = startLocation.columnNumber - 1;

  final endLocation = lineInfo.getLocation(end);
  final endLine = endLocation.lineNumber - 1;
  final endColumn = endLocation.columnNumber - 1;

  return CodeLineSelection(
    baseIndex: startLine,
    baseOffset: startColumn,
    extentIndex: endLine,
    extentOffset: endColumn,
  );
}
