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

String getAstNodeTypeName(AstNode node) {
  return switch (node) {
    final AdjacentStrings _ => 'AdjacentStrings',
    final Annotation _ => 'Annotation',
    final ArgumentList _ => 'ArgumentList',
    final AsExpression _ => 'AsExpression',
    final AssertInitializer _ => 'AssertInitializer',
    final AssertStatement _ => 'AssertStatement',
    final AssignedVariablePattern _ => 'AssignedVariablePattern',
    final AssignmentExpression _ => 'AssignmentExpression',
    final AwaitExpression _ => 'AwaitExpression',
    final BinaryExpression _ => 'BinaryExpression',
    final Block _ => 'Block',
    final BlockFunctionBody _ => 'BlockFunctionBody',
    final BooleanLiteral _ => 'BooleanLiteral',
    final BreakStatement _ => 'BreakStatement',
    final CascadeExpression _ => 'CascadeExpression',
    final CaseClause _ => 'CaseClause',
    final CastPattern _ => 'CastPattern',
    final CatchClause _ => 'CatchClause',
    final CatchClauseParameter _ => 'CatchClauseParameter',
    final ClassDeclaration _ => 'ClassDeclaration',
    final ClassTypeAlias _ => 'ClassTypeAlias',
    final Comment _ => 'Comment',
    final CommentReference _ => 'CommentReference',
    final CompilationUnit _ => 'CompilationUnit',
    final ConditionalExpression _ => 'ConditionalExpression',
    final Configuration _ => 'Configuration',
    final ConstantPattern _ => 'ConstantPattern',
    final ConstructorDeclaration _ => 'ConstructorDeclaration',
    final ConstructorFieldInitializer _ => 'ConstructorFieldInitializer',
    final ConstructorName _ => 'ConstructorName',
    final ConstructorReference _ => 'ConstructorReference',
    final ConstructorSelector _ => 'ConstructorSelector',
    final ContinueStatement _ => 'ContinueStatement',
    final DeclaredIdentifier _ => 'DeclaredIdentifier',
    final DeclaredVariablePattern _ => 'DeclaredVariablePattern',
    final DefaultFormalParameter _ => 'DefaultFormalParameter',
    final DoStatement _ => 'DoStatement',
    final DottedName _ => 'DottedName',
    final DoubleLiteral _ => 'DoubleLiteral',
    final EmptyFunctionBody _ => 'EmptyFunctionBody',
    final EmptyStatement _ => 'EmptyStatement',
    final EnumConstantArguments _ => 'EnumConstantArguments',
    final EnumConstantDeclaration _ => 'EnumConstantDeclaration',
    final EnumDeclaration _ => 'EnumDeclaration',
    final ExportDirective _ => 'ExportDirective',
    final ExpressionFunctionBody _ => 'ExpressionFunctionBody',
    final ExpressionStatement _ => 'ExpressionStatement',
    final ExtendsClause _ => 'ExtendsClause',
    final ExtensionDeclaration _ => 'ExtensionDeclaration',
    final ExtensionOverride _ => 'ExtensionOverride',
    final ExtensionTypeDeclaration _ => 'ExtensionTypeDeclaration',
    final FieldDeclaration _ => 'FieldDeclaration',
    final FieldFormalParameter _ => 'FieldFormalParameter',
    final ForEachPartsWithDeclaration _ => 'ForEachPartsWithDeclaration',
    final ForEachPartsWithIdentifier _ => 'ForEachPartsWithIdentifier',
    final ForEachPartsWithPattern _ => 'ForEachPartsWithPattern',
    final ForElement _ => 'ForElement',
    final FormalParameterList _ => 'FormalParameterList',
    final ForPartsWithDeclarations _ => 'ForPartsWithDeclarations',
    final ForPartsWithExpression _ => 'ForPartsWithExpression',
    final ForPartsWithPattern _ => 'ForPartsWithPattern',
    final ForStatement _ => 'ForStatement',
    final FunctionDeclaration _ => 'FunctionDeclaration',
    final FunctionDeclarationStatement _ => 'FunctionDeclarationStatement',
    final FunctionExpression _ => 'FunctionExpression',
    final FunctionExpressionInvocation _ => 'FunctionExpressionInvocation',
    final FunctionReference _ => 'FunctionReference',
    final FunctionTypeAlias _ => 'FunctionTypeAlias',
    final FunctionTypedFormalParameter _ => 'FunctionTypedFormalParameter',
    final GenericFunctionType _ => 'GenericFunctionType',
    final GenericTypeAlias _ => 'GenericTypeAlias',
    final GuardedPattern _ => 'GuardedPattern',
    final HideCombinator _ => 'HideCombinator',
    final IfElement _ => 'IfElement',
    final IfStatement _ => 'IfStatement',
    final ImplementsClause _ => 'ImplementsClause',
    final ImplicitCallReference _ => 'ImplicitCallReference',
    final ImportDirective _ => 'ImportDirective',
    final ImportPrefixReference _ => 'ImportPrefixReference',
    final IndexExpression _ => 'IndexExpression',
    final InstanceCreationExpression _ => 'InstanceCreationExpression',
    final IntegerLiteral _ => 'IntegerLiteral',
    final InterpolationExpression _ => 'InterpolationExpression',
    final InterpolationString _ => 'InterpolationString',
    final IsExpression _ => 'IsExpression',
    final Label _ => 'Label _',
    final LabeledStatement _ => 'LabeledStatement',
    final LibraryDirective _ => 'LibraryDirective',
    final LibraryIdentifier _ => 'LibraryIdentifier',
    final ListLiteral _ => 'ListLiteral',
    final ListPattern _ => 'ListPattern',
    final LogicalAndPattern _ => 'LogicalAndPattern',
    final LogicalOrPattern _ => 'LogicalOrPattern',
    final MapLiteralEntry _ => 'MapLiteralEntry',
    final MapPattern _ => 'MapPattern',
    final MapPatternEntry _ => 'MapPatternEntry',
    final MethodDeclaration _ => 'MethodDeclaration',
    final MethodInvocation _ => 'MethodInvocation',
    final MixinDeclaration _ => 'MixinDeclaration',
    final NamedExpression _ => 'NamedExpression',
    final NamedType _ => 'NamedType',
    final NativeClause _ => 'NativeClause',
    final NativeFunctionBody _ => 'NativeFunctionBody',
    final NullAssertPattern _ => 'NullAssertPattern',
    final NullCheckPattern _ => 'NullCheckPattern',
    final NullLiteral _ => 'NullLiteral',
    final ObjectPattern _ => 'ObjectPattern',
    final ParenthesizedExpression _ => 'ParenthesizedExpression',
    final ParenthesizedPattern _ => 'ParenthesizedPattern',
    final PartDirective _ => 'PartDirective',
    final PartOfDirective _ => 'PartOfDirective',
    final PatternAssignment _ => 'PatternAssignment',
    final PatternField _ => 'PatternField',
    final PatternFieldName _ => 'PatternFieldName',
    final PatternVariableDeclaration _ => 'PatternVariableDeclaration',
    final PatternVariableDeclarationStatement _ => 'PatternVariableDeclarationStatement',
    final PostfixExpression _ => 'PostfixExpression',
    final PrefixedIdentifier _ => 'PrefixedIdentifier',
    final PrefixExpression _ => 'PrefixExpression',
    final PropertyAccess _ => 'PropertyAccess',
    final RecordLiteral _ => 'RecordLiteral',
    final RecordPattern _ => 'RecordPattern',
    final RecordTypeAnnotation _ => 'RecordTypeAnnotation',
    final RecordTypeAnnotationNamedField _ => 'RecordTypeAnnotationNamedField',
    final RecordTypeAnnotationNamedFields _ => 'RecordTypeAnnotationNamedFields',
    final RecordTypeAnnotationPositionalField _ => 'RecordTypeAnnotationPositionalField',
    final RedirectingConstructorInvocation _ => 'RedirectingConstructorInvocation',
    final RelationalPattern _ => 'RelationalPattern',
    final RepresentationConstructorName _ => 'RepresentationConstructorName',
    final RepresentationDeclaration _ => 'RepresentationDeclaration',
    final RestPatternElement _ => 'RestPatternElement',
    final RethrowExpression _ => 'RethrowExpression',
    final ReturnStatement _ => 'ReturnStatement',
    final ScriptTag _ => 'ScriptTag',
    final SetOrMapLiteral _ => 'SetOrMapLiteral',
    final ShowCombinator _ => 'ShowCombinator',
    final SimpleFormalParameter _ => 'SimpleFormalParameter',
    final SimpleIdentifier _ => 'SimpleIdentifier',
    final SimpleStringLiteral _ => 'SimpleStringLiteral',
    final SpreadElement _ => 'SpreadElement',
    final StringInterpolation _ => 'StringInterpolation',
    final SuperConstructorInvocation _ => 'SuperConstructorInvocation',
    final SuperExpression _ => 'SuperExpression',
    final SuperFormalParameter _ => 'SuperFormalParameter',
    final SwitchCase _ => 'SwitchCase',
    final SwitchDefault _ => 'SwitchDefault',
    final SwitchExpression _ => 'SwitchExpression',
    final SwitchExpressionCase _ => 'SwitchExpressionCase',
    final SwitchPatternCase _ => 'SwitchPatternCase',
    final SwitchStatement _ => 'SwitchStatement',
    final SymbolLiteral _ => 'SymbolLiteral',
    final ThisExpression _ => 'ThisExpression',
    final ThrowExpression _ => 'ThrowExpression',
    final TopLevelVariableDeclaration _ => 'TopLevelVariableDeclaration',
    final TryStatement _ => 'TryStatement',
    final TypeArgumentList _ => 'TypeArgumentList',
    final TypeLiteral _ => 'TypeLiteral',
    final TypeParameter _ => 'TypeParameter',
    final TypeParameterList _ => 'TypeParameterList',
    final VariableDeclaration _ => 'VariableDeclaration',
    final VariableDeclarationList _ => 'VariableDeclarationList',
    final VariableDeclarationStatement _ => 'VariableDeclarationStatement',
    final WhenClause _ => 'WhenClause',
    final WhileStatement _ => 'WhileStatement',
    final WildcardPattern _ => 'WildcardPattern',
    final WithClause _ => 'WithClause',
    final YieldStatement _ => 'YieldStatement',
    final AstNode _ => 'AstNode',
  };
}
