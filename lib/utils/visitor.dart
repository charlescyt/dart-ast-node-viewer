import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

/// A visitor that builds a tree of [AstNode] nodes.
class AstTreeViewNodeVisitor extends SimpleAstVisitor<TreeViewNode<AstNode>> {
  const AstTreeViewNodeVisitor({this.expanded = true});

  final bool expanded;

  TreeViewNode<AstNode>? _visitNode(AstNode? node) {
    return node?.accept(this);
  }

  List<TreeViewNode<AstNode>>? _visitNodeList(NodeList<AstNode>? nodes) {
    return nodes?.map((node) => node.accept(this)).nonNulls.toList();
  }

  @override
  TreeViewNode<AstNode>? visitAdjacentStrings(AdjacentStrings node) {
    final strings = _visitNodeList(node.strings);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?strings,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitAnnotation(Annotation node) {
    final name = _visitNode(node.name);
    final typeArguments = _visitNode(node.typeArguments);
    final arguments = _visitNode(node.arguments);
    final constructorName = _visitNode(node.constructorName);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?name,
        ?typeArguments,
        ?arguments,
        ?constructorName,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitArgumentList(ArgumentList node) {
    final arguments = _visitNodeList(node.arguments);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?arguments,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitAsExpression(AsExpression node) {
    final expression = _visitNode(node.expression);
    final type = _visitNode(node.type);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?expression,
        ?type,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitAssertInitializer(AssertInitializer node) {
    final condition = _visitNode(node.condition);
    final message = _visitNode(node.message);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?condition,
        ?message,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitAssertStatement(AssertStatement node) {
    final condition = _visitNode(node.condition);
    final message = _visitNode(node.message);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?condition,
        ?message,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitAssignedVariablePattern(AssignedVariablePattern node) {
    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
    );
  }

  @override
  TreeViewNode<AstNode>? visitAssignmentExpression(AssignmentExpression node) {
    final leftHandSide = _visitNode(node.leftHandSide);
    final rightHandSide = _visitNode(node.rightHandSide);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?leftHandSide,
        ?rightHandSide,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitAwaitExpression(AwaitExpression node) {
    final expression = _visitNode(node.expression);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?expression,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitBinaryExpression(BinaryExpression node) {
    final leftOperand = _visitNode(node.leftOperand);
    final rightOperand = _visitNode(node.rightOperand);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?leftOperand,
        ?rightOperand,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitBlock(Block node) {
    final statements = _visitNodeList(node.statements);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?statements,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitBlockFunctionBody(BlockFunctionBody node) {
    final block = _visitNode(node.block);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?block,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitBooleanLiteral(BooleanLiteral node) {
    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
    );
  }

  @override
  TreeViewNode<AstNode>? visitBreakStatement(BreakStatement node) {
    final label = _visitNode(node.label);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?label,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitCascadeExpression(CascadeExpression node) {
    final target = _visitNode(node.target);

    final cascadeSections = _visitNodeList(node.cascadeSections);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?target,
        ...?cascadeSections,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitCaseClause(CaseClause node) {
    final guardedPattern = _visitNode(node.guardedPattern);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?guardedPattern,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitCastPattern(CastPattern node) {
    final type = _visitNode(node.type);
    final pattern = _visitNode(node.pattern);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?type,
        ?pattern,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitCatchClause(CatchClause node) {
    final exceptionType = _visitNode(node.exceptionType);
    final exceptionParameter = _visitNode(node.exceptionParameter);
    final stackTraceParameter = _visitNode(node.stackTraceParameter);
    final body = _visitNode(node.body);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?exceptionType,
        ?exceptionParameter,
        ?stackTraceParameter,
        ?body,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitCatchClauseParameter(CatchClauseParameter node) {
    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
    );
  }

  @override
  TreeViewNode<AstNode>? visitClassDeclaration(ClassDeclaration node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final typeParameters = _visitNode(node.typeParameters);
    final extendsClause = _visitNode(node.extendsClause);
    final withClause = _visitNode(node.withClause);
    final implementsClause = _visitNode(node.implementsClause);
    final members = _visitNodeList(node.members);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?typeParameters,
        ?extendsClause,
        ?withClause,
        ?implementsClause,
        ...?members,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitClassTypeAlias(ClassTypeAlias node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final typeParameters = _visitNode(node.typeParameters);
    final superclass = _visitNode(node.superclass);
    final withClause = _visitNode(node.withClause);
    final implementsClause = _visitNode(node.implementsClause);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?typeParameters,
        ?superclass,
        ?withClause,
        ?implementsClause,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitComment(Comment node) {
    final references = _visitNodeList(node.references);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?references,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitCommentReference(CommentReference node) {
    final expression = _visitNode(node.expression);
    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?expression,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitCompilationUnit(CompilationUnit node) {
    final directives = _visitNodeList(node.directives);
    final declarations = _visitNodeList(node.declarations);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?directives,
        ...?declarations,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitConditionalExpression(ConditionalExpression node) {
    final condition = _visitNode(node.condition);
    final thenExpression = _visitNode(node.thenExpression);
    final elseExpression = _visitNode(node.elseExpression);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?condition,
        ?thenExpression,
        ?elseExpression,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitConfiguration(Configuration node) {
    final name = _visitNode(node.name);
    final value = _visitNode(node.value);
    final uri = _visitNode(node.uri);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?name,
        ?value,
        ?uri,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitConstantPattern(ConstantPattern node) {
    final expression = _visitNode(node.expression);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?expression,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitConstructorDeclaration(ConstructorDeclaration node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final returnType = _visitNode(node.returnType);
    final parameters = _visitNode(node.parameters);
    final initializers = _visitNodeList(node.initializers);
    final redirectedConstructor = _visitNode(node.redirectedConstructor);
    final body = _visitNode(node.body);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?returnType,
        ?parameters,
        ...?initializers,
        ?redirectedConstructor,
        ?body,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitConstructorFieldInitializer(ConstructorFieldInitializer node) {
    final fieldName = _visitNode(node.fieldName);
    final expression = _visitNode(node.expression);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?fieldName,
        ?expression,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitConstructorName(ConstructorName node) {
    final type = _visitNode(node.type);
    final name = _visitNode(node.name);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?type,
        ?name,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitConstructorReference(ConstructorReference node) {
    final constructorName = _visitNode(node.constructorName);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?constructorName,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitConstructorSelector(ConstructorSelector node) {
    final name = _visitNode(node.name);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?name,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitContinueStatement(ContinueStatement node) {
    final target = _visitNode(node.target);
    final label = _visitNode(node.label);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?target,
        ?label,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitDeclaredIdentifier(DeclaredIdentifier node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final type = _visitNode(node.type);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?type,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitDeclaredVariablePattern(DeclaredVariablePattern node) {
    final type = _visitNode(node.type);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?type,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitDefaultFormalParameter(DefaultFormalParameter node) {
    final metadata = _visitNodeList(node.metadata);
    final parameter = _visitNode(node.parameter);
    final defaultValue = _visitNode(node.defaultValue);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?metadata,
        ?parameter,
        ?defaultValue,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitDoStatement(DoStatement node) {
    final body = _visitNode(node.body);
    final condition = _visitNode(node.condition);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?body,
        ?condition,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitDotShorthandConstructorInvocation(DotShorthandConstructorInvocation node) {
    final constructorName = _visitNode(node.constructorName);
    final typeArguments = _visitNode(node.typeArguments);
    final argumentList = _visitNode(node.argumentList);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?constructorName,
        ?typeArguments,
        ?argumentList,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitDotShorthandInvocation(DotShorthandInvocation node) {
    final memberName = _visitNode(node.memberName);
    final typeArguments = _visitNode(node.typeArguments);
    final argumentList = _visitNode(node.argumentList);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?memberName,
        ?typeArguments,
        ?argumentList,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitDotShorthandPropertyAccess(DotShorthandPropertyAccess node) {
    final propertyName = _visitNode(node.propertyName);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?propertyName,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitDottedName(DottedName node) {
    final components = _visitNodeList(node.components);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?components,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitDoubleLiteral(DoubleLiteral node) {
    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
    );
  }

  @override
  TreeViewNode<AstNode>? visitEmptyFunctionBody(EmptyFunctionBody node) {
    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
    );
  }

  @override
  TreeViewNode<AstNode>? visitEmptyStatement(EmptyStatement node) {
    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
    );
  }

  @override
  TreeViewNode<AstNode>? visitEnumConstantArguments(EnumConstantArguments node) {
    final typeArguments = _visitNode(node.typeArguments);
    final argumentList = _visitNode(node.argumentList);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?typeArguments,
        ?argumentList,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitEnumConstantDeclaration(EnumConstantDeclaration node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final arguments = _visitNode(node.arguments);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?arguments,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitEnumDeclaration(EnumDeclaration node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final typeParameters = _visitNode(node.typeParameters);
    final withClause = _visitNode(node.withClause);
    final implementsClause = _visitNode(node.implementsClause);
    final members = _visitNodeList(node.members);
    final constants = _visitNodeList(node.constants);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?typeParameters,
        ?withClause,
        ?implementsClause,
        ...?members,
        ...?constants,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitExportDirective(ExportDirective node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final uri = _visitNode(node.uri);
    final configurations = _visitNodeList(node.configurations);
    final combinators = _visitNodeList(node.combinators);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?uri,
        ...?configurations,
        ...?combinators,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitExpressionFunctionBody(ExpressionFunctionBody node) {
    final expression = _visitNode(node.expression);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?expression,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitExpressionStatement(ExpressionStatement node) {
    final expression = _visitNode(node.expression);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?expression,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitExtendsClause(ExtendsClause node) {
    final superclass = _visitNode(node.superclass);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?superclass,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitExtensionDeclaration(ExtensionDeclaration node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final typeParameters = _visitNode(node.typeParameters);
    final onClause = _visitNode(node.onClause);
    final members = _visitNodeList(node.members);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?typeParameters,
        ?onClause,
        ...?members,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitExtensionOnClause(ExtensionOnClause node) {
    final extendedType = _visitNode(node.extendedType);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?extendedType,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitExtensionOverride(ExtensionOverride node) {
    final argumentList = _visitNode(node.argumentList);
    final importPrefix = _visitNode(node.importPrefix);
    final typeArguments = _visitNode(node.typeArguments);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?argumentList,
        ?importPrefix,
        ?typeArguments,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitExtensionTypeDeclaration(ExtensionTypeDeclaration node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final typeParameters = _visitNode(node.typeParameters);
    final implementsClause = _visitNode(node.implementsClause);
    final representation = _visitNode(node.representation);
    final members = _visitNodeList(node.members);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?typeParameters,
        ?implementsClause,
        ?representation,
        ...?members,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitFieldDeclaration(FieldDeclaration node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final fields = _visitNode(node.fields);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?fields,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitFieldFormalParameter(FieldFormalParameter node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final type = _visitNode(node.type);
    final parameters = _visitNode(node.parameters);
    final typeParameters = _visitNode(node.typeParameters);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?type,
        ?parameters,
        ?typeParameters,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitForEachPartsWithDeclaration(ForEachPartsWithDeclaration node) {
    final loopVariable = _visitNode(node.loopVariable);
    final iterable = _visitNode(node.iterable);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?loopVariable,
        ?iterable,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitForEachPartsWithIdentifier(ForEachPartsWithIdentifier node) {
    final identifier = _visitNode(node.identifier);
    final iterable = _visitNode(node.iterable);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?identifier,
        ?iterable,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitForEachPartsWithPattern(ForEachPartsWithPattern node) {
    final metadata = _visitNodeList(node.metadata);
    final pattern = _visitNode(node.pattern);
    final iterable = _visitNode(node.iterable);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?metadata,
        ?pattern,
        ?iterable,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitForElement(ForElement node) {
    final forLoopParts = _visitNode(node.forLoopParts);
    final body = _visitNode(node.body);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?forLoopParts,
        ?body,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitFormalParameterList(FormalParameterList node) {
    final parameters = _visitNodeList(node.parameters);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?parameters,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitForPartsWithDeclarations(ForPartsWithDeclarations node) {
    final condition = _visitNode(node.condition);
    final variables = _visitNode(node.variables);
    final updaters = _visitNodeList(node.updaters);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?condition,
        ?variables,
        ...?updaters,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitForPartsWithExpression(ForPartsWithExpression node) {
    final initialization = _visitNode(node.initialization);
    final condition = _visitNode(node.condition);
    final updaters = _visitNodeList(node.updaters);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?initialization,
        ?condition,
        ...?updaters,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitForPartsWithPattern(ForPartsWithPattern node) {
    final variables = _visitNode(node.variables);
    final condition = _visitNode(node.condition);
    final updaters = _visitNodeList(node.updaters);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?variables,
        ?condition,
        ...?updaters,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitForStatement(ForStatement node) {
    final forLoopParts = _visitNode(node.forLoopParts);
    final body = _visitNode(node.body);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?forLoopParts,
        ?body,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitFunctionDeclaration(FunctionDeclaration node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final returnType = _visitNode(node.returnType);
    final functionExpression = _visitNode(node.functionExpression);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?returnType,
        ?functionExpression,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitFunctionDeclarationStatement(FunctionDeclarationStatement node) {
    final functionDeclaration = _visitNode(node.functionDeclaration);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?functionDeclaration,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitFunctionExpression(FunctionExpression node) {
    final parameters = _visitNode(node.parameters);
    final body = _visitNode(node.body);
    final typeParameters = _visitNode(node.typeParameters);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?parameters,
        ?typeParameters,
        ?body,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitFunctionExpressionInvocation(FunctionExpressionInvocation node) {
    final function = _visitNode(node.function);
    final argumentList = _visitNode(node.argumentList);

    final typeArguments = _visitNode(node.typeArguments);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?function,
        ?argumentList,
        ?typeArguments,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitFunctionReference(FunctionReference node) {
    final function = _visitNode(node.function);
    final typeArguments = _visitNode(node.typeArguments);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?function,
        ?typeArguments,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitFunctionTypeAlias(FunctionTypeAlias node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final returnType = _visitNode(node.returnType);
    final typeParameters = _visitNode(node.typeParameters);
    final parameters = _visitNode(node.parameters);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?returnType,
        ?typeParameters,
        ?parameters,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitFunctionTypedFormalParameter(FunctionTypedFormalParameter node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final returnType = _visitNode(node.returnType);
    final typeParameters = _visitNode(node.typeParameters);
    final parameters = _visitNode(node.parameters);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?returnType,
        ?typeParameters,
        ?parameters,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitGenericFunctionType(GenericFunctionType node) {
    final returnType = _visitNode(node.returnType);
    final typeParameters = _visitNode(node.typeParameters);
    final parameters = _visitNode(node.parameters);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?returnType,
        ?typeParameters,
        ?parameters,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitGenericTypeAlias(GenericTypeAlias node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final typeParameters = _visitNode(node.typeParameters);
    final type = _visitNode(node.type);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?typeParameters,
        ?type,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitGuardedPattern(GuardedPattern node) {
    final pattern = _visitNode(node.pattern);
    final whenClause = _visitNode(node.whenClause);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?pattern,
        ?whenClause,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitHideCombinator(HideCombinator node) {
    final hiddenNames = _visitNodeList(node.hiddenNames);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?hiddenNames,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitIfElement(IfElement node) {
    final expression = _visitNode(node.expression);
    final caseClause = _visitNode(node.caseClause);
    final thenElement = _visitNode(node.thenElement);
    final elseElement = _visitNode(node.elseElement);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?expression,
        ?caseClause,
        ?thenElement,
        ?elseElement,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitIfStatement(IfStatement node) {
    final expression = _visitNode(node.expression);
    final caseClause = _visitNode(node.caseClause);
    final thenStatement = _visitNode(node.thenStatement);
    final elseStatement = _visitNode(node.elseStatement);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?expression,
        ?caseClause,
        ?thenStatement,
        ?elseStatement,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitImplementsClause(ImplementsClause node) {
    final interfaces = _visitNodeList(node.interfaces);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?interfaces,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitImplicitCallReference(ImplicitCallReference node) {
    final expression = _visitNode(node.expression);
    final typeArguments = _visitNode(node.typeArguments);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?expression,
        ?typeArguments,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitImportDirective(ImportDirective node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final uri = _visitNode(node.uri);
    final configurations = _visitNodeList(node.configurations);
    final prefix = _visitNode(node.prefix);
    final combinators = _visitNodeList(node.combinators);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?uri,
        ...?configurations,
        ?prefix,
        ...?combinators,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitImportPrefixReference(ImportPrefixReference node) {
    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
    );
  }

  @override
  TreeViewNode<AstNode>? visitIndexExpression(IndexExpression node) {
    final realTarget = _visitNode(node.realTarget);

    final index = _visitNode(node.index);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?realTarget,
        ?index,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitInstanceCreationExpression(InstanceCreationExpression node) {
    final constructorName = _visitNode(node.constructorName);
    final argumentList = _visitNode(node.argumentList);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?constructorName,
        ?argumentList,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitIntegerLiteral(IntegerLiteral node) {
    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
    );
  }

  @override
  TreeViewNode<AstNode>? visitInterpolationExpression(InterpolationExpression node) {
    final expression = _visitNode(node.expression);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?expression,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitInterpolationString(InterpolationString node) {
    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
    );
  }

  @override
  TreeViewNode<AstNode>? visitIsExpression(IsExpression node) {
    final expression = _visitNode(node.expression);
    final type = _visitNode(node.type);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?expression,
        ?type,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitLabel(Label node) {
    final label = _visitNode(node.label);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?label,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitLabeledStatement(LabeledStatement node) {
    final statement = _visitNode(node.statement);
    final labels = _visitNodeList(node.labels);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?statement,
        ...?labels,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitLibraryDirective(LibraryDirective node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final name = _visitNode(node.name);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?name,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitLibraryIdentifier(LibraryIdentifier node) {
    final components = _visitNodeList(node.components);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?components,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitListLiteral(ListLiteral node) {
    final typeArguments = _visitNode(node.typeArguments);
    final elements = _visitNodeList(node.elements);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?typeArguments,
        ...?elements,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitListPattern(ListPattern node) {
    final elements = _visitNodeList(node.elements);
    final typeArguments = _visitNode(node.typeArguments);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?elements,
        ?typeArguments,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitLogicalAndPattern(LogicalAndPattern node) {
    final leftOperand = _visitNode(node.leftOperand);
    final rightOperand = _visitNode(node.rightOperand);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?leftOperand,
        ?rightOperand,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitLogicalOrPattern(LogicalOrPattern node) {
    final leftOperand = _visitNode(node.leftOperand);
    final rightOperand = _visitNode(node.rightOperand);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?leftOperand,
        ?rightOperand,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitMapLiteralEntry(MapLiteralEntry node) {
    final key = _visitNode(node.key);
    final value = _visitNode(node.value);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?key,
        ?value,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitMapPattern(MapPattern node) {
    final elements = _visitNodeList(node.elements);
    final typeArguments = _visitNode(node.typeArguments);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?elements,
        ?typeArguments,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitMapPatternEntry(MapPatternEntry node) {
    final key = _visitNode(node.key);
    final value = _visitNode(node.value);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?key,
        ?value,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitMethodDeclaration(MethodDeclaration node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final returnType = _visitNode(node.returnType);
    final typeParameters = _visitNode(node.typeParameters);
    final parameters = _visitNode(node.parameters);
    final body = _visitNode(node.body);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?returnType,
        ?typeParameters,
        ?parameters,
        ?body,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitMethodInvocation(MethodInvocation node) {
    final target = _visitNode(node.target);
    // final realTarget = _visitNode(node.realTarget);
    final methodName = _visitNode(node.methodName);
    final typeArguments = _visitNode(node.typeArguments);
    final argumentList = _visitNode(node.argumentList);
    // final function = _visitNode(node.function);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?target,
        // if (realTarget != null) realTarget,
        ?methodName,
        ?typeArguments,
        ?argumentList,
        // if (function != null) function,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitMixinDeclaration(MixinDeclaration node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final typeParameters = _visitNode(node.typeParameters);
    final onClause = _visitNode(node.onClause);
    final implementsClause = _visitNode(node.implementsClause);
    final members = _visitNodeList(node.members);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?typeParameters,
        ?onClause,
        ?implementsClause,
        ...?members,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitMixinOnClause(MixinOnClause node) {
    final superclassConstraints = _visitNodeList(node.superclassConstraints);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?superclassConstraints,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitNamedExpression(NamedExpression node) {
    final name = _visitNode(node.name);
    final expression = _visitNode(node.expression);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?name,
        ?expression,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitNamedType(NamedType node) {
    final importPrefix = _visitNode(node.importPrefix);
    final typeArguments = _visitNode(node.typeArguments);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?importPrefix,
        ?typeArguments,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitNativeClause(NativeClause node) {
    final name = _visitNode(node.name);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?name,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitNativeFunctionBody(NativeFunctionBody node) {
    final stringLiteral = _visitNode(node.stringLiteral);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?stringLiteral,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitNullAssertPattern(NullAssertPattern node) {
    final pattern = _visitNode(node.pattern);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?pattern,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitNullAwareElement(NullAwareElement node) {
    final value = _visitNode(node.value);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?value,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitNullCheckPattern(NullCheckPattern node) {
    final pattern = _visitNode(node.pattern);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?pattern,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitNullLiteral(NullLiteral node) {
    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
    );
  }

  @override
  TreeViewNode<AstNode>? visitObjectPattern(ObjectPattern node) {
    final type = _visitNode(node.type);
    final fields = _visitNodeList(node.fields);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?type,
        ...?fields,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitParenthesizedExpression(ParenthesizedExpression node) {
    final expression = _visitNode(node.expression);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?expression,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitParenthesizedPattern(ParenthesizedPattern node) {
    final pattern = _visitNode(node.pattern);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?pattern,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitPartDirective(PartDirective node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final uri = _visitNode(node.uri);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?uri,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitPartOfDirective(PartOfDirective node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final uri = _visitNode(node.uri);
    final libraryName = _visitNode(node.libraryName);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?uri,
        ?libraryName,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitPatternAssignment(PatternAssignment node) {
    final pattern = _visitNode(node.pattern);
    final expression = _visitNode(node.expression);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?pattern,
        ?expression,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitPatternField(PatternField node) {
    final pattern = _visitNode(node.pattern);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?pattern,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitPatternFieldName(PatternFieldName node) {
    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
    );
  }

  @override
  TreeViewNode<AstNode>? visitPatternVariableDeclaration(PatternVariableDeclaration node) {
    final pattern = _visitNode(node.pattern);
    final expression = _visitNode(node.expression);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?pattern,
        ?expression,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitPatternVariableDeclarationStatement(
    PatternVariableDeclarationStatement node,
  ) {
    final declaration = _visitNode(node.declaration);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?declaration,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitPostfixExpression(PostfixExpression node) {
    final operand = _visitNode(node.operand);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?operand,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitPrefixedIdentifier(PrefixedIdentifier node) {
    final prefix = _visitNode(node.prefix);
    final identifier = _visitNode(node.identifier);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?prefix,
        ?identifier,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitPrefixExpression(PrefixExpression node) {
    final operand = _visitNode(node.operand);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?operand,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitPropertyAccess(PropertyAccess node) {
    final realTarget = _visitNode(node.realTarget);
    final propertyName = _visitNode(node.propertyName);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?realTarget,
        ?propertyName,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitRecordLiteral(RecordLiteral node) {
    final fields = _visitNodeList(node.fields);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?fields,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitRecordPattern(RecordPattern node) {
    final fields = _visitNodeList(node.fields);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?fields,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitRecordTypeAnnotation(RecordTypeAnnotation node) {
    final positionalFields = _visitNodeList(node.positionalFields);
    final namedFields = _visitNode(node.namedFields);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?positionalFields,
        ?namedFields,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitRecordTypeAnnotationNamedField(RecordTypeAnnotationNamedField node) {
    final metadata = _visitNodeList(node.metadata);
    final type = _visitNode(node.type);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?metadata,
        ?type,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitRecordTypeAnnotationNamedFields(RecordTypeAnnotationNamedFields node) {
    final fields = _visitNodeList(node.fields);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?fields,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitRecordTypeAnnotationPositionalField(
    RecordTypeAnnotationPositionalField node,
  ) {
    final metadata = _visitNodeList(node.metadata);
    final type = _visitNode(node.type);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?metadata,
        ?type,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitRedirectingConstructorInvocation(RedirectingConstructorInvocation node) {
    final constructorName = _visitNode(node.constructorName);
    final argumentList = _visitNode(node.argumentList);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?constructorName,
        ?argumentList,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitRelationalPattern(RelationalPattern node) {
    final operand = _visitNode(node.operand);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?operand,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitRepresentationConstructorName(RepresentationConstructorName node) {
    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
    );
  }

  @override
  TreeViewNode<AstNode>? visitRepresentationDeclaration(RepresentationDeclaration node) {
    final fieldMetadata = _visitNodeList(node.fieldMetadata);
    final fieldType = _visitNode(node.fieldType);
    final constructorName = _visitNode(node.constructorName);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?fieldMetadata,
        ?fieldType,
        ?constructorName,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitRestPatternElement(RestPatternElement node) {
    final pattern = _visitNode(node.pattern);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?pattern,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitRethrowExpression(RethrowExpression node) {
    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
    );
  }

  @override
  TreeViewNode<AstNode>? visitReturnStatement(ReturnStatement node) {
    final expression = _visitNode(node.expression);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?expression,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitScriptTag(ScriptTag node) {
    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
    );
  }

  @override
  TreeViewNode<AstNode>? visitSetOrMapLiteral(SetOrMapLiteral node) {
    final typeArguments = _visitNode(node.typeArguments);
    final elements = _visitNodeList(node.elements);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?typeArguments,
        ...?elements,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitShowCombinator(ShowCombinator node) {
    final shownNames = _visitNodeList(node.shownNames);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?shownNames,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitSimpleFormalParameter(SimpleFormalParameter node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final type = _visitNode(node.type);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?type,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitSimpleIdentifier(SimpleIdentifier node) {
    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
    );
  }

  @override
  TreeViewNode<AstNode>? visitSimpleStringLiteral(SimpleStringLiteral node) {
    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
    );
  }

  @override
  TreeViewNode<AstNode>? visitSpreadElement(SpreadElement node) {
    final expression = _visitNode(node.expression);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?expression,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitStringInterpolation(StringInterpolation node) {
    final elements = _visitNodeList(node.elements);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?elements,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitSuperConstructorInvocation(SuperConstructorInvocation node) {
    final constructorName = _visitNode(node.constructorName);
    final argumentList = _visitNode(node.argumentList);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?constructorName,
        ?argumentList,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitSuperExpression(SuperExpression node) {
    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
    );
  }

  @override
  TreeViewNode<AstNode>? visitSuperFormalParameter(SuperFormalParameter node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final type = _visitNode(node.type);
    final parameters = _visitNode(node.parameters);
    final typeParameters = _visitNode(node.typeParameters);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?type,
        ?parameters,
        ?typeParameters,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitSwitchCase(SwitchCase node) {
    final labels = _visitNodeList(node.labels);
    final expression = _visitNode(node.expression);
    final statements = _visitNodeList(node.statements);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?labels,
        ?expression,
        ...?statements,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitSwitchDefault(SwitchDefault node) {
    final labels = _visitNodeList(node.labels);
    final statements = _visitNodeList(node.statements);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?labels,
        ...?statements,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitSwitchExpression(SwitchExpression node) {
    final expression = _visitNode(node.expression);
    final cases = _visitNodeList(node.cases);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?expression,
        ...?cases,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitSwitchExpressionCase(SwitchExpressionCase node) {
    final guardedPattern = _visitNode(node.guardedPattern);
    final expression = _visitNode(node.expression);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?guardedPattern,
        ?expression,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitSwitchPatternCase(SwitchPatternCase node) {
    final labels = _visitNodeList(node.labels);
    final guardedPattern = _visitNode(node.guardedPattern);
    final statements = _visitNodeList(node.statements);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?labels,
        ?guardedPattern,
        ...?statements,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitSwitchStatement(SwitchStatement node) {
    final expression = _visitNode(node.expression);
    final members = _visitNodeList(node.members);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?expression,
        ...?members,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitSymbolLiteral(SymbolLiteral node) {
    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
    );
  }

  @override
  TreeViewNode<AstNode>? visitThisExpression(ThisExpression node) {
    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
    );
  }

  @override
  TreeViewNode<AstNode>? visitThrowExpression(ThrowExpression node) {
    final expression = _visitNode(node.expression);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?expression,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitTopLevelVariableDeclaration(TopLevelVariableDeclaration node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final variables = _visitNode(node.variables);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?variables,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitTryStatement(TryStatement node) {
    final body = _visitNode(node.body);
    final catchClauses = _visitNodeList(node.catchClauses);
    final finallyBlock = _visitNode(node.finallyBlock);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?body,
        ...?catchClauses,
        ?finallyBlock,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitTypeArgumentList(TypeArgumentList node) {
    final arguments = _visitNodeList(node.arguments);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?arguments,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitTypeLiteral(TypeLiteral node) {
    final type = _visitNode(node.type);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?type,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitTypeParameter(TypeParameter node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final bound = _visitNode(node.bound);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?bound,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitTypeParameterList(TypeParameterList node) {
    final typeParameters = _visitNodeList(node.typeParameters);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?typeParameters,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitVariableDeclaration(VariableDeclaration node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final initializer = _visitNode(node.initializer);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?initializer,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitVariableDeclarationList(VariableDeclarationList node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final type = _visitNode(node.type);
    final variables = _visitNodeList(node.variables);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?documentationComment,
        ...?metadata,
        ?type,
        ...?variables,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitVariableDeclarationStatement(VariableDeclarationStatement node) {
    final variables = _visitNode(node.variables);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?variables,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitWhenClause(WhenClause node) {
    final expression = _visitNode(node.expression);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?expression,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitWhileStatement(WhileStatement node) {
    final condition = _visitNode(node.condition);
    final body = _visitNode(node.body);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?condition,
        ?body,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitWildcardPattern(WildcardPattern node) {
    final type = _visitNode(node.type);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?type,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitWithClause(WithClause node) {
    final mixinTypes = _visitNodeList(node.mixinTypes);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ...?mixinTypes,
      ],
    );
  }

  @override
  TreeViewNode<AstNode>? visitYieldStatement(YieldStatement node) {
    final expression = _visitNode(node.expression);

    return TreeViewNode<AstNode>(
      node,
      expanded: expanded,
      children: [
        ?expression,
      ],
    );
  }
}
