import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:collection/collection.dart';
import 'package:meta/meta.dart' show immutable;

@immutable
sealed class NodeEntry {
  final String label;

  const NodeEntry(this.label);
}

@immutable
class SingleNodeEntry extends NodeEntry {
  final AstNode? node;

  const SingleNodeEntry(super.label, this.node);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SingleNodeEntry && other.label == label && other.node == node;
  }

  @override
  int get hashCode => Object.hash(label, node);

  @override
  String toString() => 'SingleNodeEntry(label: $label, node: $node)';
}

@immutable
class NodeListEntry extends NodeEntry {
  final NodeList<AstNode> nodeList;

  const NodeListEntry(super.label, this.nodeList);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NodeListEntry && other.label == label && other.nodeList == nodeList;
  }

  @override
  int get hashCode => Object.hash(label, nodeList);

  @override
  String toString() => 'NodeListEntry(label: $label, nodeList: $nodeList)';
}

@immutable
class TokenEntry {
  final String label;
  final Token? token;
  const TokenEntry(this.label, this.token);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TokenEntry && other.label == label && other.token == token;
  }

  @override
  int get hashCode => Object.hash(label, token);

  @override
  String toString() => 'TokenEntry(label: $label, token: $token)';
}

@immutable
class PropertyEntry {
  final String label;
  final Object? value;

  const PropertyEntry(this.label, this.value);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PropertyEntry && other.label == label && other.value == value;
  }

  @override
  int get hashCode => Object.hash(label, value);

  @override
  String toString() => 'PropertyEntry(label: $label, value: $value)';
}

@immutable
class AstNodeInfo {
  final AstNode node;
  final List<NodeEntry> nodeEntries;
  final List<TokenEntry> tokenEntries;
  final List<PropertyEntry> propertyEntries;

  const AstNodeInfo({
    required this.node,
    this.nodeEntries = const [],
    this.tokenEntries = const [],
    this.propertyEntries = const [],
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AstNodeInfo &&
        other.node == node &&
        const DeepCollectionEquality().equals(other.nodeEntries, nodeEntries) &&
        const DeepCollectionEquality().equals(other.tokenEntries, tokenEntries) &&
        const DeepCollectionEquality().equals(other.propertyEntries, propertyEntries);
  }

  @override
  int get hashCode {
    return Object.hash(
      node,
      Object.hashAll(nodeEntries),
      Object.hashAll(tokenEntries),
      Object.hashAll(propertyEntries),
    );
  }

  @override
  String toString() {
    return 'AstNodeInfo('
        'node: $node, '
        'nodeEntries: $nodeEntries, '
        'tokenEntries: $tokenEntries, '
        'propertyEntries: $propertyEntries)';
  }

  factory AstNodeInfo.fromAstNode(AstNode node) {
    return switch (node) {
      final AdjacentStrings node => AstNodeInfo._fromAdjacentStrings(node),
      final Annotation node => AstNodeInfo._fromAnnotation(node),
      final ArgumentList node => AstNodeInfo._fromArgumentList(node),
      final AsExpression node => AstNodeInfo._fromAsExpression(node),
      final AssertInitializer node => AstNodeInfo._fromAssertInitializer(node),
      final AssertStatement node => AstNodeInfo._fromAssertStatement(node),
      final AssignedVariablePattern node => AstNodeInfo._fromAssignedVariablePattern(node),
      final AssignmentExpression node => AstNodeInfo._fromAssignmentExpression(node),
      final AugmentedExpression node => AstNodeInfo._fromAugmentedExpression(node),
      final AugmentedInvocation node => AstNodeInfo._fromAugmentedInvocation(node),
      final AwaitExpression node => AstNodeInfo._fromAwaitExpression(node),
      final BinaryExpression node => AstNodeInfo._fromBinaryExpression(node),
      final Block node => AstNodeInfo._fromBlock(node),
      final BlockFunctionBody node => AstNodeInfo._fromBlockFunctionBody(node),
      final BooleanLiteral node => AstNodeInfo._fromBooleanLiteral(node),
      final BreakStatement node => AstNodeInfo._fromBreakStatement(node),
      final CascadeExpression node => AstNodeInfo._fromCascadeExpression(node),
      final CaseClause node => AstNodeInfo._fromCaseClause(node),
      final CastPattern node => AstNodeInfo._fromCastPattern(node),
      final CatchClause node => AstNodeInfo._fromCatchClause(node),
      final CatchClauseParameter node => AstNodeInfo._fromCatchClauseParameter(node),
      final ClassDeclaration node => AstNodeInfo._fromClassDeclaration(node),
      final ClassTypeAlias node => AstNodeInfo._fromClassTypeAlias(node),
      final Comment node => AstNodeInfo._fromComment(node),
      final CommentReference node => AstNodeInfo._fromCommentReference(node),
      final CompilationUnit node => AstNodeInfo._fromCompilationUnit(node),
      final ConditionalExpression node => AstNodeInfo._fromConditionalExpression(node),
      final Configuration node => AstNodeInfo._fromConfiguration(node),
      final ConstantPattern node => AstNodeInfo._fromConstantPattern(node),
      final ConstructorDeclaration node => AstNodeInfo._fromConstructorDeclaration(node),
      final ConstructorFieldInitializer node => AstNodeInfo._fromConstructorFieldInitializer(node),
      final ConstructorName node => AstNodeInfo._fromConstructorName(node),
      final ConstructorReference node => AstNodeInfo._fromConstructorReference(node),
      final ConstructorSelector node => AstNodeInfo._fromConstructorSelector(node),
      final ContinueStatement node => AstNodeInfo._fromContinueStatement(node),
      final DeclaredIdentifier node => AstNodeInfo._fromDeclaredIdentifier(node),
      final DeclaredVariablePattern node => AstNodeInfo._fromDeclaredVariablePattern(node),
      final DefaultFormalParameter node => AstNodeInfo._fromDefaultFormalParameter(node),
      final DoStatement node => AstNodeInfo._fromDoStatement(node),
      final DottedName node => AstNodeInfo._fromDottedName(node),
      final DoubleLiteral node => AstNodeInfo._fromDoubleLiteral(node),
      final EmptyFunctionBody node => AstNodeInfo._fromEmptyFunctionBody(node),
      final EmptyStatement node => AstNodeInfo._fromEmptyStatement(node),
      final EnumConstantArguments node => AstNodeInfo._fromEnumConstantArguments(node),
      final EnumConstantDeclaration node => AstNodeInfo._fromEnumConstantDeclaration(node),
      final EnumDeclaration node => AstNodeInfo._fromEnumDeclaration(node),
      final ExportDirective node => AstNodeInfo._fromExportDirective(node),
      final ExpressionFunctionBody node => AstNodeInfo._fromExpressionFunctionBody(node),
      final ExpressionStatement node => AstNodeInfo._fromExpressionStatement(node),
      final ExtendsClause node => AstNodeInfo._fromExtendsClause(node),
      final ExtensionDeclaration node => AstNodeInfo._fromExtensionDeclaration(node),
      final ExtensionOnClause node => AstNodeInfo._fromExtensionOnClause(node),
      final ExtensionOverride node => AstNodeInfo._fromExtensionOverride(node),
      final ExtensionTypeDeclaration node => AstNodeInfo._fromExtensionTypeDeclaration(node),
      final FieldDeclaration node => AstNodeInfo._fromFieldDeclaration(node),
      final FieldFormalParameter node => AstNodeInfo._fromFieldFormalParameter(node),
      final ForEachPartsWithDeclaration node => AstNodeInfo._fromForEachPartsWithDeclaration(node),
      final ForEachPartsWithIdentifier node => AstNodeInfo._fromForEachPartsWithIdentifier(node),
      final ForEachPartsWithPattern node => AstNodeInfo._fromForEachPartsWithPattern(node),
      final ForElement node => AstNodeInfo._fromForElement(node),
      final FormalParameterList node => AstNodeInfo._fromFormalParameterList(node),
      final ForPartsWithDeclarations node => AstNodeInfo._fromForPartsWithDeclarations(node),
      final ForPartsWithExpression node => AstNodeInfo._fromForPartsWithExpression(node),
      final ForPartsWithPattern node => AstNodeInfo._fromForPartsWithPattern(node),
      final ForStatement node => AstNodeInfo._fromForStatement(node),
      final FunctionDeclaration node => AstNodeInfo._fromFunctionDeclaration(node),
      final FunctionDeclarationStatement node => AstNodeInfo._fromFunctionDeclarationStatement(
        node,
      ),
      final FunctionExpression node => AstNodeInfo._fromFunctionExpression(node),
      final FunctionExpressionInvocation node => AstNodeInfo._fromFunctionExpressionInvocation(
        node,
      ),
      final FunctionReference node => AstNodeInfo._fromFunctionReference(node),
      final FunctionTypeAlias node => AstNodeInfo._fromFunctionTypeAlias(node),
      final FunctionTypedFormalParameter node => AstNodeInfo._fromFunctionTypedFormalParameter(
        node,
      ),
      final GenericFunctionType node => AstNodeInfo._fromGenericFunctionType(node),
      final GenericTypeAlias node => AstNodeInfo._fromGenericTypeAlias(node),
      final GuardedPattern node => AstNodeInfo._fromGuardedPattern(node),
      final HideCombinator node => AstNodeInfo._fromHideCombinator(node),
      final IfElement node => AstNodeInfo._fromIfElement(node),
      final IfStatement node => AstNodeInfo._fromIfStatement(node),
      final ImplementsClause node => AstNodeInfo._fromImplementsClause(node),
      final ImplicitCallReference node => AstNodeInfo._fromImplicitCallReference(node),
      final ImportDirective node => AstNodeInfo._fromImportDirective(node),
      final ImportPrefixReference node => AstNodeInfo._fromImportPrefixReference(node),
      final IndexExpression node => AstNodeInfo._fromIndexExpression(node),
      final InstanceCreationExpression node => AstNodeInfo._fromInstanceCreationExpression(node),
      final IntegerLiteral node => AstNodeInfo._fromIntegerLiteral(node),
      final InterpolationExpression node => AstNodeInfo._fromInterpolationExpression(node),
      final InterpolationString node => AstNodeInfo._fromInterpolationString(node),
      final IsExpression node => AstNodeInfo._fromIsExpression(node),
      final Label node => AstNodeInfo._fromLabel(node),
      final LabeledStatement node => AstNodeInfo._fromLabeledStatement(node),
      final LibraryDirective node => AstNodeInfo._fromLibraryDirective(node),
      final LibraryIdentifier node => AstNodeInfo._fromLibraryIdentifier(node),
      final ListLiteral node => AstNodeInfo._fromListLiteral(node),
      final ListPattern node => AstNodeInfo._fromListPattern(node),
      final LogicalAndPattern node => AstNodeInfo._fromLogicalAndPattern(node),
      final LogicalOrPattern node => AstNodeInfo._fromLogicalOrPattern(node),
      final MapLiteralEntry node => AstNodeInfo._fromMapLiteralEntry(node),
      final MapPattern node => AstNodeInfo._fromMapPattern(node),
      final MapPatternEntry node => AstNodeInfo._fromMapPatternEntry(node),
      final MethodDeclaration node => AstNodeInfo._fromMethodDeclaration(node),
      final MethodInvocation node => AstNodeInfo._fromMethodInvocation(node),
      final MixinDeclaration node => AstNodeInfo._fromMixinDeclaration(node),
      final MixinOnClause node => AstNodeInfo._fromMixinOnClause(node),
      final NamedExpression node => AstNodeInfo._fromNamedExpression(node),
      final NamedType node => AstNodeInfo._fromNamedType(node),
      final NativeClause node => AstNodeInfo._fromNativeClause(node),
      final NativeFunctionBody node => AstNodeInfo._fromNativeFunctionBody(node),
      final NullAssertPattern node => AstNodeInfo._fromNullAssertPattern(node),
      final NullAwareElement node => AstNodeInfo._fromNullAwareElement(node),
      final NullCheckPattern node => AstNodeInfo._fromNullCheckPattern(node),
      final NullLiteral node => AstNodeInfo._fromNullLiteral(node),
      final ObjectPattern node => AstNodeInfo._fromObjectPattern(node),
      final ParenthesizedExpression node => AstNodeInfo._fromParenthesizedExpression(node),
      final ParenthesizedPattern node => AstNodeInfo._fromParenthesizedPattern(node),
      final PartDirective node => AstNodeInfo._fromPartDirective(node),
      final PartOfDirective node => AstNodeInfo._fromPartOfDirective(node),
      final PatternAssignment node => AstNodeInfo._fromPatternAssignment(node),
      final PatternField node => AstNodeInfo._fromPatternField(node),
      final PatternFieldName node => AstNodeInfo._fromPatternFieldName(node),
      final PatternVariableDeclaration node => AstNodeInfo._fromPatternVariableDeclaration(node),
      final PatternVariableDeclarationStatement node => AstNodeInfo._fromPatternVariableDeclarationStatement(node),
      final PostfixExpression node => AstNodeInfo._fromPostfixExpression(node),
      final PrefixedIdentifier node => AstNodeInfo._fromPrefixedIdentifier(node),
      final PrefixExpression node => AstNodeInfo._fromPrefixExpression(node),
      final PropertyAccess node => AstNodeInfo._fromPropertyAccess(node),
      final RecordLiteral node => AstNodeInfo._fromRecordLiteral(node),
      final RecordPattern node => AstNodeInfo._fromRecordPattern(node),
      final RecordTypeAnnotation node => AstNodeInfo._fromRecordTypeAnnotation(node),
      final RecordTypeAnnotationNamedField node => AstNodeInfo._fromRecordTypeAnnotationNamedField(
        node,
      ),
      final RecordTypeAnnotationNamedFields node => AstNodeInfo._fromRecordTypeAnnotationNamedFields(node),
      final RecordTypeAnnotationPositionalField node => AstNodeInfo._fromRecordTypeAnnotationPositionalField(node),
      final RedirectingConstructorInvocation node => AstNodeInfo._fromRedirectingConstructorInvocation(node),
      final RelationalPattern node => AstNodeInfo._fromRelationalPattern(node),
      final RepresentationConstructorName node => AstNodeInfo._fromRepresentationConstructorName(
        node,
      ),
      final RepresentationDeclaration node => AstNodeInfo._fromRepresentationDeclaration(node),
      final RestPatternElement node => AstNodeInfo._fromRestPatternElement(node),
      final RethrowExpression node => AstNodeInfo._fromRethrowExpression(node),
      final ReturnStatement node => AstNodeInfo._fromReturnStatement(node),
      final ScriptTag node => AstNodeInfo._fromScriptTag(node),
      final SetOrMapLiteral node => AstNodeInfo._fromSetOrMapLiteral(node),
      final ShowCombinator node => AstNodeInfo._fromShowCombinator(node),
      final SimpleFormalParameter node => AstNodeInfo._fromSimpleFormalParameter(node),
      final SimpleIdentifier node => AstNodeInfo._fromSimpleIdentifier(node),
      final SimpleStringLiteral node => AstNodeInfo._fromSimpleStringLiteral(node),
      final SpreadElement node => AstNodeInfo._fromSpreadElement(node),
      final StringInterpolation node => AstNodeInfo._fromStringInterpolation(node),
      final SuperConstructorInvocation node => AstNodeInfo._fromSuperConstructorInvocation(node),
      final SuperExpression node => AstNodeInfo._fromSuperExpression(node),
      final SuperFormalParameter node => AstNodeInfo._fromSuperFormalParameter(node),
      final SwitchCase node => AstNodeInfo._fromSwitchCase(node),
      final SwitchDefault node => AstNodeInfo._fromSwitchDefault(node),
      final SwitchExpression node => AstNodeInfo._fromSwitchExpression(node),
      final SwitchExpressionCase node => AstNodeInfo._fromSwitchExpressionCase(node),
      final SwitchPatternCase node => AstNodeInfo._fromSwitchPatternCase(node),
      final SwitchStatement node => AstNodeInfo._fromSwitchStatement(node),
      final SymbolLiteral node => AstNodeInfo._fromSymbolLiteral(node),
      final ThisExpression node => AstNodeInfo._fromThisExpression(node),
      final ThrowExpression node => AstNodeInfo._fromThrowExpression(node),
      final TopLevelVariableDeclaration node => AstNodeInfo._fromTopLevelVariableDeclaration(node),
      final TryStatement node => AstNodeInfo._fromTryStatement(node),
      final TypeArgumentList node => AstNodeInfo._fromTypeArgumentList(node),
      final TypeLiteral node => AstNodeInfo._fromTypeLiteral(node),
      final TypeParameter node => AstNodeInfo._fromTypeParameter(node),
      final TypeParameterList node => AstNodeInfo._fromTypeParameterList(node),
      final VariableDeclaration node => AstNodeInfo._fromVariableDeclaration(node),
      final VariableDeclarationList node => AstNodeInfo._fromVariableDeclarationList(node),
      final VariableDeclarationStatement node => AstNodeInfo._fromVariableDeclarationStatement(
        node,
      ),
      final WhenClause node => AstNodeInfo._fromWhenClause(node),
      final WhileStatement node => AstNodeInfo._fromWhileStatement(node),
      final WildcardPattern node => AstNodeInfo._fromWildcardPattern(node),
      final WithClause node => AstNodeInfo._fromWithClause(node),
      final YieldStatement node => AstNodeInfo._fromYieldStatement(node),
      _ => AstNodeInfo(node: node),
    };
  }

  factory AstNodeInfo._fromAdjacentStrings(AdjacentStrings node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('strings', node.strings),
      ],
      propertyEntries: [
        PropertyEntry('isAssignable', node.isAssignable),
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('stringValue', node.stringValue),
      ],
    );
  }

  factory AstNodeInfo._fromAnnotation(Annotation node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('name', node.name),
        SingleNodeEntry('typeArguments', node.typeArguments),
        SingleNodeEntry('constructorName', node.constructorName),
        SingleNodeEntry('arguments', node.arguments),
      ],
      tokenEntries: [
        TokenEntry('atSign', node.atSign),
        TokenEntry('period', node.period),
      ],
    );
  }

  factory AstNodeInfo._fromArgumentList(ArgumentList node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('arguments', node.arguments),
      ],
      tokenEntries: [
        TokenEntry('leftParenthesis', node.leftParenthesis),
        TokenEntry('rightParenthesis', node.rightParenthesis),
      ],
    );
  }

  factory AstNodeInfo._fromAsExpression(AsExpression node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('expression', node.expression),
        SingleNodeEntry('type', node.type),
      ],
      tokenEntries: [
        TokenEntry('asOperator', node.asOperator),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromAssertInitializer(AssertInitializer node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('condition', node.condition),
        SingleNodeEntry('message', node.message),
      ],
      tokenEntries: [
        TokenEntry('assertKeyword', node.assertKeyword),
        TokenEntry('leftParenthesis', node.leftParenthesis),
        TokenEntry('comma', node.comma),
        TokenEntry('rightParenthesis', node.rightParenthesis),
      ],
    );
  }

  factory AstNodeInfo._fromAssertStatement(AssertStatement node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('condition', node.condition),
        SingleNodeEntry('message', node.message),
      ],
      tokenEntries: [
        TokenEntry('assertKeyword', node.assertKeyword),
        TokenEntry('leftParenthesis', node.leftParenthesis),
        TokenEntry('comma', node.comma),
        TokenEntry('rightParenthesis', node.rightParenthesis),
        TokenEntry('semicolon', node.semicolon),
      ],
    );
  }

  factory AstNodeInfo._fromAssignedVariablePattern(AssignedVariablePattern node) {
    return AstNodeInfo(
      node: node,
    );
  }

  factory AstNodeInfo._fromAssignmentExpression(AssignmentExpression node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('leftHandSide', node.leftHandSide),
        SingleNodeEntry('rightHandSide', node.rightHandSide),
      ],
      tokenEntries: [
        TokenEntry('operator', node.operator),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromAugmentedExpression(AugmentedExpression node) {
    return AstNodeInfo(
      node: node,
    );
  }

  factory AstNodeInfo._fromAugmentedInvocation(AugmentedInvocation node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('arguments', node.arguments),
        SingleNodeEntry('typeArguments', node.typeArguments),
      ],
      tokenEntries: [
        TokenEntry('augmentedKeyword', node.augmentedKeyword),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromAwaitExpression(AwaitExpression node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('expression', node.expression),
      ],
      tokenEntries: [
        TokenEntry('awaitKeyword', node.awaitKeyword),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromBinaryExpression(BinaryExpression node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('leftOperand', node.leftOperand),
        SingleNodeEntry('rightOperand', node.rightOperand),
      ],
      tokenEntries: [
        TokenEntry('operator', node.operator),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromBlock(Block node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('statements', node.statements),
      ],
      tokenEntries: [
        TokenEntry('leftBracket', node.leftBracket),
        TokenEntry('rightBracket', node.rightBracket),
      ],
    );
  }

  factory AstNodeInfo._fromBlockFunctionBody(BlockFunctionBody node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('block', node.block),
      ],
      tokenEntries: [
        TokenEntry('keyword', node.keyword),
        TokenEntry('star', node.star),
      ],
      propertyEntries: [
        PropertyEntry('isAsynchronous', node.isAsynchronous),
        PropertyEntry('isGenerator', node.isGenerator),
        PropertyEntry('isSynchronous', node.isSynchronous),
      ],
    );
  }

  factory AstNodeInfo._fromBooleanLiteral(BooleanLiteral node) {
    return AstNodeInfo(
      node: node,
      tokenEntries: [
        TokenEntry('literal', node.literal),
      ],
      propertyEntries: [
        PropertyEntry('value', node.value),
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromBreakStatement(BreakStatement node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('target', node.target),
        SingleNodeEntry('label', node.label),
      ],
      tokenEntries: [
        TokenEntry('breakKeyword', node.breakKeyword),
        TokenEntry('semicolon', node.semicolon),
      ],
    );
  }

  factory AstNodeInfo._fromCascadeExpression(CascadeExpression node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('target', node.target),
        NodeListEntry('cascadeSections', node.cascadeSections),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
        PropertyEntry('isNullAware', node.isNullAware),
      ],
    );
  }

  factory AstNodeInfo._fromCaseClause(CaseClause node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('guardedPattern', node.guardedPattern),
      ],
      tokenEntries: [
        TokenEntry('caseKeyword', node.caseKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromCastPattern(CastPattern node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('type', node.type),
        SingleNodeEntry('pattern', node.pattern),
      ],
      tokenEntries: [
        TokenEntry('asKeyword', node.asToken),
      ],
    );
  }

  factory AstNodeInfo._fromCatchClause(CatchClause node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('exceptionType', node.exceptionType),
        SingleNodeEntry('exceptionParameter', node.exceptionParameter),
        SingleNodeEntry('stackTraceParameter', node.stackTraceParameter),
        SingleNodeEntry('body', node.body),
      ],
      tokenEntries: [
        TokenEntry('onKeyword', node.onKeyword),
        TokenEntry('catchKeyword', node.catchKeyword),
        TokenEntry('leftParenthesis', node.leftParenthesis),
        TokenEntry('comma', node.comma),
        TokenEntry('rightParenthesis', node.rightParenthesis),
      ],
    );
  }

  factory AstNodeInfo._fromCatchClauseParameter(CatchClauseParameter node) {
    return AstNodeInfo(
      node: node,
      tokenEntries: [
        TokenEntry('name', node.name),
      ],
    );
  }

  factory AstNodeInfo._fromClassDeclaration(ClassDeclaration node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('metadata', node.metadata),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('typeParameters', node.typeParameters),
        SingleNodeEntry('extendsClause', node.extendsClause),
        SingleNodeEntry('withClause', node.withClause),
        SingleNodeEntry('implementsClause', node.implementsClause),
        NodeListEntry('members', node.members),
      ],
      tokenEntries: [
        TokenEntry('sealedKeyword', node.sealedKeyword),
        TokenEntry('abstractKeyword', node.abstractKeyword),
        TokenEntry('baseKeyword', node.baseKeyword),
        TokenEntry('interfaceKeyword', node.interfaceKeyword),
        TokenEntry('finalKeyword', node.finalKeyword),
        TokenEntry('mixinKeyword', node.mixinKeyword),
        TokenEntry('augmentKeyword', node.augmentKeyword),
        TokenEntry('classKeyword', node.classKeyword),
        TokenEntry('name', node.name),
        TokenEntry('leftBracket', node.leftBracket),
        TokenEntry('rightBracket', node.rightBracket),
      ],
    );
  }

  factory AstNodeInfo._fromClassTypeAlias(ClassTypeAlias node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('typeParameters', node.typeParameters),
        SingleNodeEntry('superclass', node.superclass),
        SingleNodeEntry('withClause', node.withClause),
        SingleNodeEntry('implementsClause', node.implementsClause),
      ],
      tokenEntries: [
        TokenEntry('sealedKeyword', node.sealedKeyword),
        TokenEntry('abstractKeyword', node.abstractKeyword),
        TokenEntry('baseKeyword', node.baseKeyword),
        TokenEntry('interfaceKeyword', node.interfaceKeyword),
        TokenEntry('finalKeyword', node.finalKeyword),
        TokenEntry('mixinKeyword', node.mixinKeyword),
        TokenEntry('augmentKeyword', node.augmentKeyword),
        TokenEntry('typedefKeyword', node.typedefKeyword),
        TokenEntry('name', node.name),
        TokenEntry('equals', node.equals),
        TokenEntry('semicolon', node.semicolon),
      ],
    );
  }

  factory AstNodeInfo._fromComment(Comment node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('references', node.references),
      ],
      tokenEntries: [
        for (final (index, token) in node.tokens.indexed) //
          TokenEntry('tokens[$index]', token),
      ],
    );
  }

  factory AstNodeInfo._fromCommentReference(CommentReference node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('expression', node.expression),
      ],
      tokenEntries: [
        TokenEntry('newKeyword', node.newKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromCompilationUnit(CompilationUnit node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('directives', node.directives),
        NodeListEntry('declarations', node.declarations),
      ],
      propertyEntries: [
        PropertyEntry('languageVersion.effective', node.languageVersion.effective),
      ],
    );
  }

  factory AstNodeInfo._fromConditionalExpression(ConditionalExpression node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('condition', node.condition),
        SingleNodeEntry('thenExpression', node.thenExpression),
        SingleNodeEntry('elseExpression', node.elseExpression),
      ],
      tokenEntries: [
        TokenEntry('question', node.question),
        TokenEntry('colon', node.colon),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromConfiguration(Configuration node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('name', node.name),
        SingleNodeEntry('value', node.value),
        SingleNodeEntry('uri', node.uri),
      ],
      tokenEntries: [
        TokenEntry('ifKeyword', node.ifKeyword),
        TokenEntry('equalToken', node.equalToken),
        TokenEntry('leftParenthesis', node.leftParenthesis),
        TokenEntry('rightParenthesis', node.rightParenthesis),
      ],
    );
  }

  factory AstNodeInfo._fromConstantPattern(ConstantPattern node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('expression', node.expression),
      ],
      tokenEntries: [
        TokenEntry('constKeyword', node.constKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromConstructorDeclaration(ConstructorDeclaration node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('returnType', node.returnType),
        SingleNodeEntry('parameters', node.parameters),
        NodeListEntry('initializers', node.initializers),
        SingleNodeEntry('redirectedConstructor', node.redirectedConstructor),
        SingleNodeEntry('body', node.body),
      ],
      tokenEntries: [
        TokenEntry('externalKeyword', node.externalKeyword),
        TokenEntry('constKeyword', node.constKeyword),
        TokenEntry('factoryKeyword', node.factoryKeyword),
        TokenEntry('augmentKeyword', node.augmentKeyword),
        TokenEntry('name', node.name),
        TokenEntry('period', node.period),
        TokenEntry('separator', node.separator),
      ],
    );
  }

  factory AstNodeInfo._fromConstructorFieldInitializer(ConstructorFieldInitializer node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('fieldName', node.fieldName),
        SingleNodeEntry('expression', node.expression),
      ],
      tokenEntries: [
        TokenEntry('thisKeyword', node.thisKeyword),
        TokenEntry('equals', node.equals),
        TokenEntry('period', node.period),
      ],
    );
  }

  factory AstNodeInfo._fromConstructorName(ConstructorName node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('type', node.type),
        SingleNodeEntry('name', node.name),
      ],
      tokenEntries: [
        TokenEntry('period', node.period),
      ],
    );
  }

  factory AstNodeInfo._fromConstructorReference(ConstructorReference node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('constructorName', node.constructorName),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromConstructorSelector(ConstructorSelector node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('name', node.name),
      ],
      tokenEntries: [
        TokenEntry('period', node.period),
      ],
    );
  }

  factory AstNodeInfo._fromContinueStatement(ContinueStatement node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('target', node.target),
        SingleNodeEntry('label', node.label),
      ],
      tokenEntries: [
        TokenEntry('continueKeyword', node.continueKeyword),
        TokenEntry('semicolon', node.semicolon),
      ],
    );
  }

  factory AstNodeInfo._fromDeclaredIdentifier(DeclaredIdentifier node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('type', node.type),
      ],
      tokenEntries: [
        TokenEntry('name', node.name),
        TokenEntry('keyword', node.keyword),
      ],
      propertyEntries: [
        PropertyEntry('isConst', node.isConst),
        PropertyEntry('isFinal', node.isFinal),
      ],
    );
  }

  factory AstNodeInfo._fromDeclaredVariablePattern(DeclaredVariablePattern node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('type', node.type),
      ],
      tokenEntries: [
        TokenEntry('name', node.name),
        TokenEntry('keyword', node.keyword),
      ],
    );
  }

  factory AstNodeInfo._fromDefaultFormalParameter(DefaultFormalParameter node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('parameter', node.parameter),
        SingleNodeEntry('defaultValue', node.defaultValue),
      ],
      tokenEntries: [
        TokenEntry('requiredKeyword', node.requiredKeyword),
        TokenEntry('covariantKeyword', node.covariantKeyword),
        TokenEntry('name', node.name),
        TokenEntry('separator', node.separator),
      ],
      propertyEntries: [
        PropertyEntry('isConst', node.isConst),
        PropertyEntry('isExplicitlyTyped', node.isExplicitlyTyped),
        PropertyEntry('isFinal', node.isFinal),
        PropertyEntry('isNamed', node.isNamed),
        PropertyEntry('isOptional', node.isOptional),
        PropertyEntry('isOptionalNamed', node.isOptionalNamed),
        PropertyEntry('isOptionalPositional', node.isOptionalPositional),
        PropertyEntry('isPositional', node.isPositional),
        PropertyEntry('isRequiredNamed', node.isRequiredNamed),
        PropertyEntry('isRequiredPositional', node.isRequiredPositional),
        PropertyEntry('isRequired', node.isRequired),
      ],
    );
  }

  factory AstNodeInfo._fromDoStatement(DoStatement node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('body', node.body),
        SingleNodeEntry('condition', node.condition),
      ],
      tokenEntries: [
        TokenEntry('doKeyword', node.doKeyword),
        TokenEntry('whileKeyword', node.whileKeyword),
        TokenEntry('leftParenthesis', node.leftParenthesis),
        TokenEntry('rightParenthesis', node.rightParenthesis),
        TokenEntry('semicolon', node.semicolon),
      ],
    );
  }

  factory AstNodeInfo._fromDottedName(DottedName node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('components', node.components),
      ],
    );
  }

  factory AstNodeInfo._fromDoubleLiteral(DoubleLiteral node) {
    return AstNodeInfo(
      node: node,
      tokenEntries: [
        TokenEntry('literal', node.literal),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
        PropertyEntry('value', node.value),
      ],
    );
  }

  factory AstNodeInfo._fromEmptyFunctionBody(EmptyFunctionBody node) {
    return AstNodeInfo(
      node: node,
      tokenEntries: [
        TokenEntry('keyword', node.keyword),
        TokenEntry('semicolon', node.semicolon),
        TokenEntry('star', node.star),
      ],
      propertyEntries: [
        PropertyEntry('isAsynchronous', node.isAsynchronous),
        PropertyEntry('isGenerator', node.isGenerator),
        PropertyEntry('isSynchronous', node.isSynchronous),
      ],
    );
  }

  factory AstNodeInfo._fromEmptyStatement(EmptyStatement node) {
    return AstNodeInfo(
      node: node,
      tokenEntries: [
        TokenEntry('semicolon', node.semicolon),
      ],
    );
  }

  factory AstNodeInfo._fromEnumConstantArguments(EnumConstantArguments node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('typeArguments', node.typeArguments),
        SingleNodeEntry('argumentList', node.argumentList),
        SingleNodeEntry('constructorSelector', node.constructorSelector),
      ],
    );
  }

  factory AstNodeInfo._fromEnumConstantDeclaration(EnumConstantDeclaration node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('arguments', node.arguments),
      ],
      tokenEntries: [
        TokenEntry('name', node.name),
        TokenEntry('augmentKeyword', node.augmentKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromEnumDeclaration(EnumDeclaration node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('typeParameters', node.typeParameters),
        SingleNodeEntry('withClause', node.withClause),
        SingleNodeEntry('implementsClause', node.implementsClause),
        NodeListEntry('members', node.members),
        NodeListEntry('constants', node.constants),
      ],
      tokenEntries: [
        TokenEntry('enumKeyword', node.enumKeyword),
        TokenEntry('augmentKeyword', node.augmentKeyword),
        TokenEntry('leftBracket', node.leftBracket),
        TokenEntry('rightBracket', node.rightBracket),
        TokenEntry('name', node.name),
        TokenEntry('semicolon', node.semicolon),
      ],
    );
  }

  factory AstNodeInfo._fromExportDirective(ExportDirective node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('uri', node.uri),
        NodeListEntry('configurations', node.configurations),
        NodeListEntry('combinators', node.combinators),
      ],
      tokenEntries: [
        TokenEntry('exportKeyword', node.exportKeyword),
        TokenEntry('semicolon', node.semicolon),
      ],
    );
  }

  factory AstNodeInfo._fromExpressionFunctionBody(ExpressionFunctionBody node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('expression', node.expression),
      ],
      tokenEntries: [
        TokenEntry('keyword', node.keyword),
        TokenEntry('functionDefinition', node.functionDefinition),
        TokenEntry('semicolon', node.semicolon),
        TokenEntry('star', node.star),
      ],
      propertyEntries: [
        PropertyEntry('isAsynchronous', node.isAsynchronous),
        PropertyEntry('isGenerator', node.isGenerator),
        PropertyEntry('isSynchronous', node.isSynchronous),
      ],
    );
  }

  factory AstNodeInfo._fromExpressionStatement(ExpressionStatement node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('expression', node.expression),
      ],
      tokenEntries: [
        TokenEntry('semicolon', node.semicolon),
      ],
    );
  }

  factory AstNodeInfo._fromExtendsClause(ExtendsClause node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('superclass', node.superclass),
      ],
      tokenEntries: [
        TokenEntry('extendsKeyword', node.extendsKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromExtensionDeclaration(ExtensionDeclaration node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('typeParameters', node.typeParameters),
        SingleNodeEntry('onClause', node.onClause),
        NodeListEntry('members', node.members),
      ],
      tokenEntries: [
        TokenEntry('extensionKeyword', node.extensionKeyword),
        TokenEntry('name', node.name),
        TokenEntry('leftBracket', node.leftBracket),
        TokenEntry('rightBracket', node.rightBracket),
        TokenEntry('augmentKeyword', node.augmentKeyword),
        TokenEntry('typeKeyword', node.typeKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromExtensionOnClause(ExtensionOnClause node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('extendedType', node.extendedType),
      ],
      tokenEntries: [
        TokenEntry('onKeyword', node.onKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromExtensionOverride(ExtensionOverride node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('argumentList', node.argumentList),
        SingleNodeEntry('importPrefix', node.importPrefix),
        SingleNodeEntry('typeArguments', node.typeArguments),
      ],
      tokenEntries: [
        TokenEntry('name', node.name),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
        PropertyEntry('isNullAware', node.isNullAware),
      ],
    );
  }

  factory AstNodeInfo._fromExtensionTypeDeclaration(ExtensionTypeDeclaration node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('typeParameters', node.typeParameters),
        NodeListEntry('members', node.members),
        SingleNodeEntry('implementsClause', node.implementsClause),
        SingleNodeEntry('representation', node.representation),
      ],
      tokenEntries: [
        TokenEntry('extensionKeyword', node.extensionKeyword),
        TokenEntry('name', node.name),
        TokenEntry('leftBracket', node.leftBracket),
        TokenEntry('rightBracket', node.rightBracket),
        TokenEntry('typeKeyword', node.typeKeyword),
        TokenEntry('augmentKeyword', node.augmentKeyword),
        TokenEntry('constKeyword', node.constKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromFieldDeclaration(FieldDeclaration node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('fields', node.fields),
      ],
      tokenEntries: [
        TokenEntry('staticKeyword', node.staticKeyword),
        TokenEntry('covariantKeyword', node.covariantKeyword),
        TokenEntry('augmentKeyword', node.augmentKeyword),
        TokenEntry('abstractKeyword', node.abstractKeyword),
        TokenEntry('externalKeyword', node.externalKeyword),
        TokenEntry('semicolon', node.semicolon),
      ],
      propertyEntries: [
        PropertyEntry('isStatic', node.isStatic),
      ],
    );
  }

  factory AstNodeInfo._fromFieldFormalParameter(FieldFormalParameter node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('typeParameters', node.typeParameters),
        SingleNodeEntry('type', node.type),
        SingleNodeEntry('parameters', node.parameters),
      ],
      tokenEntries: [
        TokenEntry('thisKeyword', node.thisKeyword),
        TokenEntry('covariantKeyword', node.covariantKeyword),
        TokenEntry('keyword', node.keyword),
        TokenEntry('name', node.name),
        TokenEntry('period', node.period),
        TokenEntry('question', node.question),
        TokenEntry('requiredKeyword', node.requiredKeyword),
      ],
      propertyEntries: [
        PropertyEntry('isConst', node.isConst),
        PropertyEntry('isExplicitlyTyped', node.isExplicitlyTyped),
        PropertyEntry('isFinal', node.isFinal),
        PropertyEntry('isNamed', node.isNamed),
        PropertyEntry('isOptional', node.isOptional),
        PropertyEntry('isOptionalNamed', node.isOptionalNamed),
        PropertyEntry('isOptionalPositional', node.isOptionalPositional),
        PropertyEntry('isPositional', node.isPositional),
        PropertyEntry('isRequired', node.isRequired),
        PropertyEntry('isRequiredNamed', node.isRequiredNamed),
        PropertyEntry('isRequiredPositional', node.isRequiredPositional),
      ],
    );
  }

  factory AstNodeInfo._fromForEachPartsWithDeclaration(ForEachPartsWithDeclaration node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('loopVariable', node.loopVariable),
        SingleNodeEntry('iterable', node.iterable),
      ],
      tokenEntries: [
        TokenEntry('inKeyword', node.inKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromForEachPartsWithIdentifier(ForEachPartsWithIdentifier node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('identifier', node.identifier),
        SingleNodeEntry('iterable', node.iterable),
      ],
      tokenEntries: [
        TokenEntry('inKeyword', node.inKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromForEachPartsWithPattern(ForEachPartsWithPattern node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('pattern', node.pattern),
        SingleNodeEntry('iterable', node.iterable),
      ],
      tokenEntries: [
        TokenEntry('inKeyword', node.inKeyword),
        TokenEntry('keyword', node.keyword),
      ],
    );
  }

  factory AstNodeInfo._fromForElement(ForElement node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('forLoopParts', node.forLoopParts),
        SingleNodeEntry('body', node.body),
      ],
      tokenEntries: [
        TokenEntry('forKeyword', node.forKeyword),
        TokenEntry('rightParenthesis', node.rightParenthesis),
        TokenEntry('rightParenthesis', node.rightParenthesis),
        TokenEntry('awaitKeyword', node.awaitKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromFormalParameterList(FormalParameterList node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('parameters', node.parameters),
      ],
      tokenEntries: [
        TokenEntry('leftParenthesis', node.leftParenthesis),
        TokenEntry('rightParenthesis', node.rightParenthesis),
        TokenEntry('leftDelimiter', node.leftDelimiter),
        TokenEntry('rightDelimiter', node.rightDelimiter),
      ],
    );
  }

  factory AstNodeInfo._fromForPartsWithDeclarations(ForPartsWithDeclarations node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('condition', node.condition),
        SingleNodeEntry('variables', node.variables),
        NodeListEntry('updaters', node.updaters),
      ],
      tokenEntries: [
        TokenEntry('leftSeparator', node.leftSeparator),
        TokenEntry('rightSeparator', node.rightSeparator),
      ],
    );
  }

  factory AstNodeInfo._fromForPartsWithExpression(ForPartsWithExpression node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('initialization', node.initialization),
        SingleNodeEntry('condition', node.condition),
        NodeListEntry('updaters', node.updaters),
      ],
      tokenEntries: [
        TokenEntry('leftSeparator', node.leftSeparator),
        TokenEntry('rightSeparator', node.rightSeparator),
      ],
    );
  }

  factory AstNodeInfo._fromForPartsWithPattern(ForPartsWithPattern node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('variables', node.variables),
        SingleNodeEntry('condition', node.condition),
        NodeListEntry('updaters', node.updaters),
      ],
      tokenEntries: [
        TokenEntry('leftSeparator', node.leftSeparator),
        TokenEntry('rightSeparator', node.rightSeparator),
      ],
    );
  }

  factory AstNodeInfo._fromForStatement(ForStatement node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('forLoopParts', node.forLoopParts),
        SingleNodeEntry('body', node.body),
      ],
      tokenEntries: [
        TokenEntry('forKeyword', node.forKeyword),
        TokenEntry('leftParenthesis', node.leftParenthesis),
        TokenEntry('rightParenthesis', node.rightParenthesis),
        TokenEntry('awaitKeyword', node.awaitKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromFunctionDeclaration(FunctionDeclaration node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('returnType', node.returnType),
        SingleNodeEntry('functionExpression', node.functionExpression),
      ],
      tokenEntries: [
        TokenEntry('name', node.name),
        TokenEntry('propertyKeyword', node.propertyKeyword),
        TokenEntry('externalKeyword', node.externalKeyword),
        TokenEntry('augmentKeyword', node.augmentKeyword),
        TokenEntry('externalKeyword', node.externalKeyword),
      ],
      propertyEntries: [
        PropertyEntry('isGetter', node.isGetter),
        PropertyEntry('isSetter', node.isSetter),
      ],
    );
  }

  factory AstNodeInfo._fromFunctionDeclarationStatement(FunctionDeclarationStatement node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('functionDeclaration', node.functionDeclaration),
      ],
    );
  }

  factory AstNodeInfo._fromFunctionExpression(FunctionExpression node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('typeParameters', node.typeParameters),
        SingleNodeEntry('parameters', node.parameters),
        SingleNodeEntry('body', node.body),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromFunctionExpressionInvocation(FunctionExpressionInvocation node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('function', node.function),
        SingleNodeEntry('argumentList', node.argumentList),
        SingleNodeEntry('typeArguments', node.typeArguments),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromFunctionReference(FunctionReference node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('function', node.function),
        SingleNodeEntry('typeArguments', node.typeArguments),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromFunctionTypeAlias(FunctionTypeAlias node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('returnType', node.returnType),
        SingleNodeEntry('typeParameters', node.typeParameters),
        SingleNodeEntry('parameters', node.parameters),
      ],
      tokenEntries: [
        TokenEntry('name', node.name),
        TokenEntry('augmentKeyword', node.augmentKeyword),
        TokenEntry('semicolon', node.semicolon),
        TokenEntry('typedefKeyword', node.typedefKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromFunctionTypedFormalParameter(FunctionTypedFormalParameter node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('returnType', node.returnType),
        SingleNodeEntry('typeParameters', node.typeParameters),
        SingleNodeEntry('parameters', node.parameters),
      ],
      tokenEntries: [
        TokenEntry('name', node.name),
        TokenEntry('covariantKeyword', node.covariantKeyword),
        TokenEntry('question', node.question),
        TokenEntry('requiredKeyword', node.requiredKeyword),
      ],
      propertyEntries: [
        PropertyEntry('isConst', node.isConst),
        PropertyEntry('isExplicitlyTyped', node.isExplicitlyTyped),
        PropertyEntry('isFinal', node.isFinal),
        PropertyEntry('isNamed', node.isNamed),
        PropertyEntry('isOptional', node.isOptional),
        PropertyEntry('isOptionalNamed', node.isOptionalNamed),
        PropertyEntry('isOptionalPositional', node.isOptionalPositional),
        PropertyEntry('isPositional', node.isPositional),
        PropertyEntry('isRequired', node.isRequired),
        PropertyEntry('isRequiredNamed', node.isRequiredNamed),
        PropertyEntry('isRequiredPositional', node.isRequiredPositional),
      ],
    );
  }

  factory AstNodeInfo._fromGenericFunctionType(GenericFunctionType node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('returnType', node.returnType),
        SingleNodeEntry('typeParameters', node.typeParameters),
        SingleNodeEntry('parameters', node.parameters),
      ],
      tokenEntries: [
        TokenEntry('question', node.question),
        TokenEntry('functionKeyword', node.functionKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromGenericTypeAlias(GenericTypeAlias node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('typeParameters', node.typeParameters),
        SingleNodeEntry('type', node.type),
        SingleNodeEntry('functionType', node.functionType),
      ],
      tokenEntries: [
        TokenEntry('name', node.name),
        TokenEntry('augmentKeyword', node.augmentKeyword),
        TokenEntry('semicolon', node.semicolon),
        TokenEntry('typedefKeyword', node.typedefKeyword),
        TokenEntry('equals', node.equals),
        TokenEntry('firstTokenAfterCommentAndMetadata', node.firstTokenAfterCommentAndMetadata),
      ],
    );
  }

  factory AstNodeInfo._fromGuardedPattern(GuardedPattern node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('pattern', node.pattern),
        SingleNodeEntry('whenClause', node.whenClause),
      ],
    );
  }

  factory AstNodeInfo._fromHideCombinator(HideCombinator node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('hiddenNames', node.hiddenNames),
      ],
      tokenEntries: [
        TokenEntry('keyword', node.keyword),
      ],
    );
  }

  factory AstNodeInfo._fromIfElement(IfElement node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('expression', node.expression),
        SingleNodeEntry('caseClause', node.caseClause),
        SingleNodeEntry('thenElement', node.thenElement),
        SingleNodeEntry('elseElement', node.elseElement),
      ],
      tokenEntries: [
        TokenEntry('ifKeyword', node.ifKeyword),
        TokenEntry('leftParenthesis', node.leftParenthesis),
        TokenEntry('rightParenthesis', node.rightParenthesis),
        TokenEntry('elseKeyword', node.elseKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromIfStatement(IfStatement node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('expression', node.expression),
        SingleNodeEntry('caseClause', node.caseClause),
        SingleNodeEntry('thenStatement', node.thenStatement),
        SingleNodeEntry('elseStatement', node.elseStatement),
      ],
      tokenEntries: [
        TokenEntry('ifKeyword', node.ifKeyword),
        TokenEntry('leftParenthesis', node.leftParenthesis),
        TokenEntry('rightParenthesis', node.rightParenthesis),
        TokenEntry('elseKeyword', node.elseKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromImplementsClause(ImplementsClause node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('interfaces', node.interfaces),
      ],
      tokenEntries: [
        TokenEntry('implementsKeyword', node.implementsKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromImplicitCallReference(ImplicitCallReference node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('expression', node.expression),
        SingleNodeEntry('typeArguments', node.typeArguments),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromImportDirective(ImportDirective node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('uri', node.uri),
        NodeListEntry('configurations', node.configurations),
        SingleNodeEntry('prefix', node.prefix),
        NodeListEntry('combinators', node.combinators),
      ],
      tokenEntries: [
        TokenEntry('importKeyword', node.importKeyword),
        TokenEntry('asKeyword', node.asKeyword),
        TokenEntry('deferredKeyword', node.deferredKeyword),
        TokenEntry('firstTokenAfterCommentAndMetadata', node.firstTokenAfterCommentAndMetadata),
        TokenEntry('semicolon', node.semicolon),
      ],
    );
  }

  factory AstNodeInfo._fromImportPrefixReference(ImportPrefixReference node) {
    return AstNodeInfo(
      node: node,
      tokenEntries: [
        TokenEntry('name', node.name),
        TokenEntry('period', node.period),
      ],
    );
  }

  factory AstNodeInfo._fromIndexExpression(IndexExpression node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('target', node.target),
        SingleNodeEntry('realTarget', node.realTarget),
        SingleNodeEntry('index', node.index),
      ],
      tokenEntries: [
        TokenEntry('leftBracket', node.leftBracket),
        TokenEntry('rightBracket', node.rightBracket),
        TokenEntry('period', node.period),
        TokenEntry('question', node.question),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
        PropertyEntry('isCascaded', node.isCascaded),
        PropertyEntry('isNullAware', node.isNullAware),
      ],
    );
  }

  factory AstNodeInfo._fromInstanceCreationExpression(InstanceCreationExpression node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('constructorName', node.constructorName),
        SingleNodeEntry('argumentList', node.argumentList),
      ],
      tokenEntries: [
        TokenEntry('keyword', node.keyword),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
        PropertyEntry('isConst', node.isConst),
      ],
    );
  }

  factory AstNodeInfo._fromIntegerLiteral(IntegerLiteral node) {
    return AstNodeInfo(
      node: node,
      tokenEntries: [
        TokenEntry('literal', node.literal),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
        PropertyEntry('value', node.value),
      ],
    );
  }

  factory AstNodeInfo._fromInterpolationExpression(InterpolationExpression node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('expression', node.expression),
      ],
      tokenEntries: [
        TokenEntry('leftBracket', node.leftBracket),
        TokenEntry('rightBracket', node.rightBracket),
      ],
    );
  }

  factory AstNodeInfo._fromInterpolationString(InterpolationString node) {
    return AstNodeInfo(
      node: node,
      tokenEntries: [
        TokenEntry('contents', node.contents),
      ],
      propertyEntries: [
        PropertyEntry('value', node.value),
      ],
    );
  }

  factory AstNodeInfo._fromIsExpression(IsExpression node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('expression', node.expression),
        SingleNodeEntry('type', node.type),
      ],
      tokenEntries: [
        TokenEntry('isOperator', node.isOperator),
        TokenEntry('notOperator', node.notOperator),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromLabel(Label node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('label', node.label),
      ],
      tokenEntries: [
        TokenEntry('colon', node.colon),
      ],
    );
  }

  factory AstNodeInfo._fromLabeledStatement(LabeledStatement node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('labels', node.labels),
        SingleNodeEntry('statement', node.statement),
      ],
    );
  }

  factory AstNodeInfo._fromLibraryDirective(LibraryDirective node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('name2', node.name2),
      ],
      tokenEntries: [
        TokenEntry('firstTokenAfterCommentAndMetadata', node.firstTokenAfterCommentAndMetadata),
        TokenEntry('libraryKeyword', node.libraryKeyword),
        TokenEntry('semicolon', node.semicolon),
      ],
    );
  }

  factory AstNodeInfo._fromLibraryIdentifier(LibraryIdentifier node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('components', node.components),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
        PropertyEntry('name', node.name),
      ],
    );
  }

  factory AstNodeInfo._fromListLiteral(ListLiteral node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('typeArguments', node.typeArguments),
        NodeListEntry('elements', node.elements),
      ],
      tokenEntries: [
        TokenEntry('constKeyword', node.constKeyword),
        TokenEntry('leftBracket', node.leftBracket),
        TokenEntry('rightBracket', node.rightBracket),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
        PropertyEntry('isConst', node.isConst),
      ],
    );
  }

  factory AstNodeInfo._fromListPattern(ListPattern node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('typeArguments', node.typeArguments),
        NodeListEntry('elements', node.elements),
      ],
      tokenEntries: [
        TokenEntry('leftBracket', node.leftBracket),
        TokenEntry('rightBracket', node.rightBracket),
      ],
    );
  }

  factory AstNodeInfo._fromLogicalAndPattern(LogicalAndPattern node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('leftOperand', node.leftOperand),
        SingleNodeEntry('rightOperand', node.rightOperand),
      ],
      tokenEntries: [
        TokenEntry('operator', node.operator),
      ],
    );
  }

  factory AstNodeInfo._fromLogicalOrPattern(LogicalOrPattern node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('leftOperand', node.leftOperand),
        SingleNodeEntry('rightOperand', node.rightOperand),
      ],
      tokenEntries: [
        TokenEntry('operator', node.operator),
      ],
    );
  }

  factory AstNodeInfo._fromMapLiteralEntry(MapLiteralEntry node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('key', node.key),
        SingleNodeEntry('value', node.value),
      ],
      tokenEntries: [
        TokenEntry('keyQuestion', node.keyQuestion),
        TokenEntry('separator', node.separator),
        TokenEntry('valueQuestion', node.valueQuestion),
      ],
    );
  }

  factory AstNodeInfo._fromMapPattern(MapPattern node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('typeArguments', node.typeArguments),
        NodeListEntry('elements', node.elements),
      ],
      tokenEntries: [
        TokenEntry('leftBracket', node.leftBracket),
        TokenEntry('rightBracket', node.rightBracket),
      ],
    );
  }

  factory AstNodeInfo._fromMapPatternEntry(MapPatternEntry node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('key', node.key),
        SingleNodeEntry('value', node.value),
      ],
      tokenEntries: [
        TokenEntry('separator', node.separator),
      ],
    );
  }

  factory AstNodeInfo._fromMethodDeclaration(MethodDeclaration node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('returnType', node.returnType),
        SingleNodeEntry('typeParameters', node.typeParameters),
        SingleNodeEntry('parameters', node.parameters),
        SingleNodeEntry('body', node.body),
      ],
      tokenEntries: [
        TokenEntry('externalKeyword', node.externalKeyword),
        TokenEntry('operatorKeyword', node.operatorKeyword),
        TokenEntry('augmentKeyword', node.augmentKeyword),
        TokenEntry('modifierKeyword', node.modifierKeyword),
        TokenEntry('propertyKeyword', node.propertyKeyword),
        TokenEntry('name', node.name),
        TokenEntry('firstTokenAfterCommentAndMetadata', node.firstTokenAfterCommentAndMetadata),
      ],
      propertyEntries: [
        PropertyEntry('isAbstract', node.isAbstract),
        PropertyEntry('isGetter', node.isGetter),
        PropertyEntry('isOperator', node.isOperator),
        PropertyEntry('isSetter', node.isSetter),
        PropertyEntry('isStatic', node.isStatic),
      ],
    );
  }

  factory AstNodeInfo._fromMethodInvocation(MethodInvocation node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('target', node.target),
        SingleNodeEntry('realTarget', node.realTarget),
        SingleNodeEntry('methodName', node.methodName),
        SingleNodeEntry('typeArguments', node.typeArguments),
        SingleNodeEntry('argumentList', node.argumentList),
        SingleNodeEntry('function', node.function),
      ],
      tokenEntries: [
        TokenEntry('operator', node.operator),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
        PropertyEntry('isCascaded', node.isCascaded),
        PropertyEntry('isNullAware', node.isNullAware),
      ],
    );
  }

  factory AstNodeInfo._fromMixinDeclaration(MixinDeclaration node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('typeParameters', node.typeParameters),
        SingleNodeEntry('onClause', node.onClause),
        SingleNodeEntry('implementsClause', node.implementsClause),
        NodeListEntry('members', node.members),
      ],
      tokenEntries: [
        TokenEntry('augmentKeyword', node.augmentKeyword),
        TokenEntry('baseKeyword', node.baseKeyword),
        TokenEntry('mixinKeyword', node.mixinKeyword),
        TokenEntry('name', node.name),
        TokenEntry('firstTokenAfterCommentAndMetadata', node.firstTokenAfterCommentAndMetadata),
        TokenEntry('leftBracket', node.leftBracket),
        TokenEntry('rightBracket', node.rightBracket),
      ],
    );
  }

  factory AstNodeInfo._fromMixinOnClause(MixinOnClause node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('superclassConstraints', node.superclassConstraints),
      ],
      tokenEntries: [
        TokenEntry('onKeyword', node.onKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromNamedExpression(NamedExpression node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('name', node.name),
        SingleNodeEntry('expression', node.expression),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromNamedType(NamedType node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('importPrefix', node.importPrefix),
        SingleNodeEntry('typeArguments', node.typeArguments),
      ],
      tokenEntries: [
        TokenEntry('name2', node.name2),
        TokenEntry('question', node.question),
      ],
      propertyEntries: [
        PropertyEntry('isDeferred', node.isDeferred),
      ],
    );
  }

  factory AstNodeInfo._fromNativeClause(NativeClause node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('name', node.name),
      ],
      tokenEntries: [
        TokenEntry('nativeKeyword', node.nativeKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromNativeFunctionBody(NativeFunctionBody node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('stringLiteral', node.stringLiteral),
      ],
      tokenEntries: [
        TokenEntry('nativeKeyword', node.nativeKeyword),
        TokenEntry('keyword', node.keyword),
        TokenEntry('star', node.star),
        TokenEntry('semicolon', node.semicolon),
      ],
      propertyEntries: [
        PropertyEntry('isAsynchronous', node.isAsynchronous),
        PropertyEntry('isGenerator', node.isGenerator),
        PropertyEntry('isSynchronous', node.isSynchronous),
      ],
    );
  }

  factory AstNodeInfo._fromNullAssertPattern(NullAssertPattern node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('pattern', node.pattern),
      ],
      tokenEntries: [
        TokenEntry('operator', node.operator),
      ],
    );
  }

  factory AstNodeInfo._fromNullAwareElement(NullAwareElement node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('value', node.value),
      ],
      tokenEntries: [
        TokenEntry('question', node.question),
      ],
    );
  }

  factory AstNodeInfo._fromNullCheckPattern(NullCheckPattern node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('pattern', node.pattern),
      ],
      tokenEntries: [
        TokenEntry('operator', node.operator),
      ],
    );
  }

  factory AstNodeInfo._fromNullLiteral(NullLiteral node) {
    return AstNodeInfo(
      node: node,
      tokenEntries: [
        TokenEntry('literal', node.literal),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromObjectPattern(ObjectPattern node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('type', node.type),
        NodeListEntry('fields', node.fields),
      ],
      tokenEntries: [
        TokenEntry('leftParenthesis', node.leftParenthesis),
        TokenEntry('rightParenthesis', node.rightParenthesis),
      ],
    );
  }

  factory AstNodeInfo._fromParenthesizedExpression(ParenthesizedExpression node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('expression', node.expression),
      ],
      tokenEntries: [
        TokenEntry('leftParenthesis', node.leftParenthesis),
        TokenEntry('rightParenthesis', node.rightParenthesis),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromParenthesizedPattern(ParenthesizedPattern node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('pattern', node.pattern),
      ],
      tokenEntries: [
        TokenEntry('leftParenthesis', node.leftParenthesis),
        TokenEntry('rightParenthesis', node.rightParenthesis),
      ],
    );
  }

  factory AstNodeInfo._fromPartDirective(PartDirective node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('uri', node.uri),
        NodeListEntry('configurations', node.configurations),
      ],
      tokenEntries: [
        TokenEntry('partKeyword', node.partKeyword),
        TokenEntry('semicolon', node.semicolon),
        TokenEntry('firstTokenAfterCommentAndMetadata', node.firstTokenAfterCommentAndMetadata),
      ],
    );
  }

  factory AstNodeInfo._fromPartOfDirective(PartOfDirective node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('uri', node.uri),
        SingleNodeEntry('libraryName', node.libraryName),
      ],
      tokenEntries: [
        TokenEntry('firstTokenAfterCommentAndMetadata', node.firstTokenAfterCommentAndMetadata),
        TokenEntry('partKeyword', node.partKeyword),
        TokenEntry('ofKeyword', node.ofKeyword),
        TokenEntry('semicolon', node.semicolon),
      ],
    );
  }

  factory AstNodeInfo._fromPatternAssignment(PatternAssignment node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('pattern', node.pattern),
        SingleNodeEntry('expression', node.expression),
      ],
      tokenEntries: [
        TokenEntry('equals', node.equals),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromPatternField(PatternField node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('name', node.name),
        SingleNodeEntry('pattern', node.pattern),
      ],
      propertyEntries: [
        PropertyEntry('effectiveName', node.effectiveName),
      ],
    );
  }

  factory AstNodeInfo._fromPatternFieldName(PatternFieldName node) {
    return AstNodeInfo(
      node: node,
      tokenEntries: [
        TokenEntry('name', node.name),
        TokenEntry('colon', node.colon),
      ],
    );
  }

  factory AstNodeInfo._fromPatternVariableDeclaration(PatternVariableDeclaration node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('pattern', node.pattern),
        SingleNodeEntry('expression', node.expression),
      ],
      tokenEntries: [
        TokenEntry('firstTokenAfterCommentAndMetadata', node.firstTokenAfterCommentAndMetadata),
        TokenEntry('equals', node.equals),
        TokenEntry('keyword', node.keyword),
      ],
    );
  }

  factory AstNodeInfo._fromPatternVariableDeclarationStatement(
    PatternVariableDeclarationStatement node,
  ) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('declaration', node.declaration),
      ],
      tokenEntries: [
        TokenEntry('semicolon', node.semicolon),
      ],
    );
  }

  factory AstNodeInfo._fromPostfixExpression(PostfixExpression node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('operand', node.operand),
      ],
      tokenEntries: [
        TokenEntry('operator', node.operator),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromPrefixedIdentifier(PrefixedIdentifier node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('prefix', node.prefix),
        SingleNodeEntry('identifier', node.identifier),
      ],
      tokenEntries: [
        TokenEntry('period', node.period),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
        PropertyEntry('isDeferred', node.isDeferred),
        PropertyEntry('name', node.name),
      ],
    );
  }

  factory AstNodeInfo._fromPrefixExpression(PrefixExpression node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('operand', node.operand),
      ],
      tokenEntries: [
        TokenEntry('operator', node.operator),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromPropertyAccess(PropertyAccess node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('target', node.target),
        SingleNodeEntry('realTarget', node.realTarget),
        SingleNodeEntry('propertyName', node.propertyName),
      ],
      tokenEntries: [
        TokenEntry('operator', node.operator),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
        PropertyEntry('isCascaded', node.isCascaded),
        PropertyEntry('isNullAware', node.isNullAware),
      ],
    );
  }

  factory AstNodeInfo._fromRecordLiteral(RecordLiteral node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('fields', node.fields),
      ],
      tokenEntries: [
        TokenEntry('constKeyword', node.constKeyword),
        TokenEntry('leftParenthesis', node.leftParenthesis),
        TokenEntry('rightParenthesis', node.rightParenthesis),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
        PropertyEntry('isConst', node.isConst),
      ],
    );
  }

  factory AstNodeInfo._fromRecordPattern(RecordPattern node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('fields', node.fields),
      ],
      tokenEntries: [
        TokenEntry('leftParenthesis', node.leftParenthesis),
        TokenEntry('rightParenthesis', node.rightParenthesis),
      ],
    );
  }

  factory AstNodeInfo._fromRecordTypeAnnotation(RecordTypeAnnotation node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('positionalFields', node.positionalFields),
        SingleNodeEntry('namedFields', node.namedFields),
      ],
      tokenEntries: [
        TokenEntry('leftParenthesis', node.leftParenthesis),
        TokenEntry('rightParenthesis', node.rightParenthesis),
        TokenEntry('question', node.question),
      ],
    );
  }

  factory AstNodeInfo._fromRecordTypeAnnotationNamedField(RecordTypeAnnotationNamedField node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('type', node.type),
      ],
      tokenEntries: [
        TokenEntry('name', node.name),
      ],
    );
  }

  factory AstNodeInfo._fromRecordTypeAnnotationNamedFields(RecordTypeAnnotationNamedFields node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('fields', node.fields),
      ],
      tokenEntries: [
        TokenEntry('leftBracket', node.leftBracket),
        TokenEntry('rightBracket', node.rightBracket),
      ],
    );
  }

  factory AstNodeInfo._fromRecordTypeAnnotationPositionalField(
    RecordTypeAnnotationPositionalField node,
  ) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('type', node.type),
      ],
      tokenEntries: [
        TokenEntry('name', node.name),
      ],
    );
  }

  factory AstNodeInfo._fromRedirectingConstructorInvocation(RedirectingConstructorInvocation node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('constructorName', node.constructorName),
        SingleNodeEntry('argumentList', node.argumentList),
      ],
      tokenEntries: [
        TokenEntry('period', node.period),
        TokenEntry('thisKeyword', node.thisKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromRelationalPattern(RelationalPattern node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('operand', node.operand),
      ],
      tokenEntries: [
        TokenEntry('operator', node.operator),
      ],
    );
  }

  factory AstNodeInfo._fromRepresentationConstructorName(RepresentationConstructorName node) {
    return AstNodeInfo(
      node: node,
      tokenEntries: [
        TokenEntry('name', node.name),
        TokenEntry('period', node.period),
      ],
    );
  }

  factory AstNodeInfo._fromRepresentationDeclaration(RepresentationDeclaration node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('fieldMetadata', node.fieldMetadata),
        SingleNodeEntry('fieldType', node.fieldType),
        SingleNodeEntry('constructorName', node.constructorName),
      ],
      tokenEntries: [
        TokenEntry('fieldName', node.fieldName),
        TokenEntry('leftParenthesis', node.leftParenthesis),
        TokenEntry('rightParenthesis', node.rightParenthesis),
      ],
    );
  }

  factory AstNodeInfo._fromRestPatternElement(RestPatternElement node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('pattern', node.pattern),
      ],
      tokenEntries: [
        TokenEntry('operator', node.operator),
      ],
    );
  }

  factory AstNodeInfo._fromRethrowExpression(RethrowExpression node) {
    return AstNodeInfo(
      node: node,
      tokenEntries: [
        TokenEntry('rethrowKeyword', node.rethrowKeyword),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromReturnStatement(ReturnStatement node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('expression', node.expression),
      ],
      tokenEntries: [
        TokenEntry('returnKeyword', node.returnKeyword),
        TokenEntry('semicolon', node.semicolon),
      ],
    );
  }

  factory AstNodeInfo._fromScriptTag(ScriptTag node) {
    return AstNodeInfo(
      node: node,
      tokenEntries: [
        TokenEntry('scriptTag', node.scriptTag),
      ],
    );
  }

  factory AstNodeInfo._fromSetOrMapLiteral(SetOrMapLiteral node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('typeArguments', node.typeArguments),
        NodeListEntry('elements', node.elements),
      ],
      tokenEntries: [
        TokenEntry('constKeyword', node.constKeyword),
        TokenEntry('leftBracket', node.leftBracket),
        TokenEntry('rightBracket', node.rightBracket),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
        PropertyEntry('isConst', node.isConst),
        PropertyEntry('isMap', node.isMap),
        PropertyEntry('isSet', node.isSet),
      ],
    );
  }

  factory AstNodeInfo._fromShowCombinator(ShowCombinator node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('shownNames', node.shownNames),
      ],
      tokenEntries: [
        TokenEntry('keyword', node.keyword),
      ],
    );
  }

  factory AstNodeInfo._fromSimpleFormalParameter(SimpleFormalParameter node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('type', node.type),
      ],
      tokenEntries: [
        TokenEntry('firstTokenAfterCommentAndMetadata', node.firstTokenAfterCommentAndMetadata),
        TokenEntry('keyword', node.keyword),
        TokenEntry('covariantKeyword', node.covariantKeyword),
        TokenEntry('requiredKeyword', node.requiredKeyword),
        TokenEntry('name', node.name),
      ],
      propertyEntries: [
        PropertyEntry('isConst', node.isConst),
        PropertyEntry('isExplicitlyTyped', node.isExplicitlyTyped),
        PropertyEntry('isFinal', node.isFinal),
        PropertyEntry('isNamed', node.isNamed),
        PropertyEntry('isOptional', node.isOptional),
        PropertyEntry('isOptionalNamed', node.isOptionalNamed),
        PropertyEntry('isOptionalPositional', node.isOptionalPositional),
        PropertyEntry('isPositional', node.isPositional),
        PropertyEntry('isRequired', node.isRequired),
        PropertyEntry('isRequiredNamed', node.isRequiredNamed),
        PropertyEntry('isRequiredPositional', node.isRequiredPositional),
      ],
    );
  }

  factory AstNodeInfo._fromSimpleIdentifier(SimpleIdentifier node) {
    return AstNodeInfo(
      node: node,
      tokenEntries: [
        TokenEntry('token', node.token),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
        PropertyEntry('isQualified', node.isQualified),
        PropertyEntry('name', node.name),
      ],
    );
  }

  factory AstNodeInfo._fromSimpleStringLiteral(SimpleStringLiteral node) {
    return AstNodeInfo(
      node: node,
      tokenEntries: [
        TokenEntry('literal', node.literal),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
        PropertyEntry('isMultiline', node.isMultiline),
        PropertyEntry('isRaw', node.isRaw),
        PropertyEntry('isSingleQuoted', node.isSingleQuoted),
        PropertyEntry('stringValue', node.stringValue),
        PropertyEntry('value', node.value),
      ],
    );
  }

  factory AstNodeInfo._fromSpreadElement(SpreadElement node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('expression', node.expression),
      ],
      tokenEntries: [
        TokenEntry('spreadOperator', node.spreadOperator),
      ],
      propertyEntries: [
        PropertyEntry('isNullAware', node.isNullAware),
      ],
    );
  }

  factory AstNodeInfo._fromStringInterpolation(StringInterpolation node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('elements', node.elements),
        SingleNodeEntry('firstString', node.firstString),
        SingleNodeEntry('lastString', node.lastString),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
        PropertyEntry('isMultiline', node.isMultiline),
        PropertyEntry('isRaw', node.isRaw),
        PropertyEntry('isSingleQuoted', node.isSingleQuoted),
        PropertyEntry('stringValue', node.stringValue),
      ],
    );
  }

  factory AstNodeInfo._fromSuperConstructorInvocation(SuperConstructorInvocation node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('constructorName', node.constructorName),
        SingleNodeEntry('argumentList', node.argumentList),
      ],
      tokenEntries: [
        TokenEntry('superKeyword', node.superKeyword),
        TokenEntry('period', node.period),
      ],
    );
  }

  factory AstNodeInfo._fromSuperExpression(SuperExpression node) {
    return AstNodeInfo(
      node: node,
      tokenEntries: [
        TokenEntry('superKeyword', node.superKeyword),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromSuperFormalParameter(SuperFormalParameter node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('type', node.type),
        SingleNodeEntry('parameters', node.parameters),
        SingleNodeEntry('typeParameters', node.typeParameters),
      ],
      tokenEntries: [
        TokenEntry('firstTokenAfterCommentAndMetadata', node.firstTokenAfterCommentAndMetadata),
        TokenEntry('superKeyword', node.superKeyword),
        TokenEntry('period', node.period),
        TokenEntry('question', node.question),
        TokenEntry('name', node.name),
        TokenEntry('covariantKeyword', node.covariantKeyword),
        TokenEntry('requiredKeyword', node.requiredKeyword),
        TokenEntry('keyword', node.keyword),
      ],
      propertyEntries: [
        PropertyEntry('isConst', node.isConst),
        PropertyEntry('isExplicitlyTyped', node.isExplicitlyTyped),
        PropertyEntry('isFinal', node.isFinal),
        PropertyEntry('isNamed', node.isNamed),
        PropertyEntry('isOptional', node.isOptional),
        PropertyEntry('isOptionalNamed', node.isOptionalNamed),
        PropertyEntry('isOptionalPositional', node.isOptionalPositional),
        PropertyEntry('isPositional', node.isPositional),
        PropertyEntry('isRequired', node.isRequired),
        PropertyEntry('isRequiredNamed', node.isRequiredNamed),
        PropertyEntry('isRequiredPositional', node.isRequiredPositional),
      ],
    );
  }

  factory AstNodeInfo._fromSwitchCase(SwitchCase node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('labels', node.labels),
        SingleNodeEntry('expression', node.expression),
        NodeListEntry('statements', node.statements),
      ],
      tokenEntries: [
        TokenEntry('colon', node.colon),
        TokenEntry('keyword', node.keyword),
      ],
    );
  }

  factory AstNodeInfo._fromSwitchDefault(SwitchDefault node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('labels', node.labels),
        NodeListEntry('statements', node.statements),
      ],
      tokenEntries: [
        TokenEntry('colon', node.colon),
        TokenEntry('keyword', node.keyword),
      ],
    );
  }

  factory AstNodeInfo._fromSwitchExpression(SwitchExpression node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('expression', node.expression),
        NodeListEntry('cases', node.cases),
      ],
      tokenEntries: [
        TokenEntry('switchKeyword', node.switchKeyword),
        TokenEntry('leftParenthesis', node.leftParenthesis),
        TokenEntry('rightParenthesis', node.rightParenthesis),
        TokenEntry('leftBracket', node.leftBracket),
        TokenEntry('rightBracket', node.rightBracket),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromSwitchExpressionCase(SwitchExpressionCase node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('guardedPattern', node.guardedPattern),
        SingleNodeEntry('expression', node.expression),
      ],
      tokenEntries: [
        TokenEntry('arrow', node.arrow),
      ],
    );
  }

  factory AstNodeInfo._fromSwitchPatternCase(SwitchPatternCase node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('labels', node.labels),
        SingleNodeEntry('guardedPattern', node.guardedPattern),
        NodeListEntry('statements', node.statements),
      ],
      tokenEntries: [
        TokenEntry('colon', node.colon),
        TokenEntry('keyword', node.keyword),
      ],
    );
  }

  factory AstNodeInfo._fromSwitchStatement(SwitchStatement node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('expression', node.expression),
        NodeListEntry('members', node.members),
      ],
      tokenEntries: [
        TokenEntry('switchKeyword', node.switchKeyword),
        TokenEntry('leftParenthesis', node.leftParenthesis),
        TokenEntry('rightParenthesis', node.rightParenthesis),
        TokenEntry('leftBracket', node.leftBracket),
        TokenEntry('rightBracket', node.rightBracket),
      ],
    );
  }

  factory AstNodeInfo._fromSymbolLiteral(SymbolLiteral node) {
    return AstNodeInfo(
      node: node,
      tokenEntries: [
        TokenEntry('poundSign', node.poundSign),
        for (final (index, token) in node.components.indexed) //
          TokenEntry('components[$index]', token),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromThisExpression(ThisExpression node) {
    return AstNodeInfo(
      node: node,
      tokenEntries: [
        TokenEntry('thisKeyword', node.thisKeyword),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromThrowExpression(ThrowExpression node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('expression', node.expression),
      ],
      tokenEntries: [
        TokenEntry('throwKeyword', node.throwKeyword),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromTopLevelVariableDeclaration(TopLevelVariableDeclaration node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('variables', node.variables),
      ],
      tokenEntries: [
        TokenEntry('firstTokenAfterCommentAndMetadata', node.firstTokenAfterCommentAndMetadata),
        TokenEntry('augmentKeyword', node.augmentKeyword),
        TokenEntry('externalKeyword', node.externalKeyword),
        TokenEntry('semicolon', node.semicolon),
      ],
    );
  }

  factory AstNodeInfo._fromTryStatement(TryStatement node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('body', node.body),
        NodeListEntry('catchClauses', node.catchClauses),
        SingleNodeEntry('finallyBlock', node.finallyBlock),
      ],
      tokenEntries: [
        TokenEntry('tryKeyword', node.tryKeyword),
        TokenEntry('finallyKeyword', node.finallyKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromTypeArgumentList(TypeArgumentList node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('arguments', node.arguments),
      ],
      tokenEntries: [
        TokenEntry('leftBracket', node.leftBracket),
        TokenEntry('rightBracket', node.rightBracket),
      ],
    );
  }

  factory AstNodeInfo._fromTypeLiteral(TypeLiteral node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('type', node.type),
      ],
      propertyEntries: [
        PropertyEntry('inConstantContext', node.inConstantContext),
        PropertyEntry('isAssignable', node.isAssignable),
      ],
    );
  }

  factory AstNodeInfo._fromTypeParameter(TypeParameter node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('bound', node.bound),
      ],
      tokenEntries: [
        TokenEntry('firstTokenAfterCommentAndMetadata', node.firstTokenAfterCommentAndMetadata),
        TokenEntry('name', node.name),
        TokenEntry('extendsKeyword', node.extendsKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromTypeParameterList(TypeParameterList node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('typeParameters', node.typeParameters),
      ],
      tokenEntries: [
        TokenEntry('leftBracket', node.leftBracket),
        TokenEntry('rightBracket', node.rightBracket),
      ],
    );
  }

  factory AstNodeInfo._fromVariableDeclaration(VariableDeclaration node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('initializer', node.initializer),
      ],
      tokenEntries: [
        TokenEntry('firstTokenAfterCommentAndMetadata', node.firstTokenAfterCommentAndMetadata),
        TokenEntry('name', node.name),
        TokenEntry('equals', node.equals),
      ],
      propertyEntries: [
        PropertyEntry('isConst', node.isConst),
        PropertyEntry('isFinal', node.isFinal),
        PropertyEntry('isLate', node.isLate),
      ],
    );
  }

  factory AstNodeInfo._fromVariableDeclarationList(VariableDeclarationList node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('documentationComment', node.documentationComment),
        NodeListEntry('metadata', node.metadata),
        SingleNodeEntry('type', node.type),
        NodeListEntry('variables', node.variables),
      ],
      tokenEntries: [
        TokenEntry('firstTokenAfterCommentAndMetadata', node.firstTokenAfterCommentAndMetadata),
        TokenEntry('keyword', node.keyword),
        TokenEntry('lateKeyword', node.lateKeyword),
      ],
      propertyEntries: [
        PropertyEntry('isConst', node.isConst),
        PropertyEntry('isFinal', node.isFinal),
        PropertyEntry('isLate', node.isLate),
      ],
    );
  }

  factory AstNodeInfo._fromVariableDeclarationStatement(VariableDeclarationStatement node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('variables', node.variables),
      ],
      tokenEntries: [
        TokenEntry('semicolon', node.semicolon),
      ],
    );
  }

  factory AstNodeInfo._fromWhenClause(WhenClause node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('expression', node.expression),
      ],
      tokenEntries: [
        TokenEntry('whenKeyword', node.whenKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromWhileStatement(WhileStatement node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('condition', node.condition),
        SingleNodeEntry('body', node.body),
      ],
      tokenEntries: [
        TokenEntry('whileKeyword', node.whileKeyword),
        TokenEntry('leftParenthesis', node.leftParenthesis),
        TokenEntry('rightParenthesis', node.rightParenthesis),
      ],
    );
  }

  factory AstNodeInfo._fromWildcardPattern(WildcardPattern node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('type', node.type),
      ],
      tokenEntries: [
        TokenEntry('keyword', node.keyword),
        TokenEntry('name', node.name),
      ],
    );
  }

  factory AstNodeInfo._fromWithClause(WithClause node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        NodeListEntry('mixinTypes', node.mixinTypes),
      ],
      tokenEntries: [
        TokenEntry('withKeyword', node.withKeyword),
      ],
    );
  }

  factory AstNodeInfo._fromYieldStatement(YieldStatement node) {
    return AstNodeInfo(
      node: node,
      nodeEntries: [
        SingleNodeEntry('expression', node.expression),
      ],
      tokenEntries: [
        TokenEntry('yieldKeyword', node.yieldKeyword),
        TokenEntry('star', node.star),
        TokenEntry('semicolon', node.semicolon),
      ],
    );
  }
}
