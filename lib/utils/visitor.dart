import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:collection/collection.dart';

import '../models/tree_node.dart';

/// A visitor that builds a tree of [AstNode] nodes.
class AstTreeNodeVisitor extends SimpleAstVisitor<TreeNode<AstNode>> {
  const AstTreeNodeVisitor();

  TreeNode<AstNode>? _visitNode(AstNode? node) {
    return node?.accept(this);
  }

  List<TreeNode<AstNode>>? _visitNodeList(NodeList<AstNode>? nodes) {
    return nodes?.map((node) => node.accept(this)).whereNotNull().toList();
  }

  @override
  TreeNode<AstNode>? visitAdjacentStrings(AdjacentStrings node) {
    final strings = _visitNodeList(node.strings);

    return TreeNode<AstNode>(
      node,
      children: [
        if (strings != null) ...strings,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitAnnotation(Annotation node) {
    final name = _visitNode(node.name);
    final arguments = _visitNode(node.arguments);
    final constructorName = _visitNode(node.constructorName);
    final typeArguments = _visitNode(node.typeArguments);

    return TreeNode<AstNode>(
      node,
      children: [
        if (name != null) name,
        if (arguments != null) arguments,
        if (constructorName != null) constructorName,
        if (typeArguments != null) typeArguments,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitArgumentList(ArgumentList node) {
    final arguments = _visitNodeList(node.arguments);

    return TreeNode<AstNode>(
      node,
      children: [
        if (arguments != null) ...arguments,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitAsExpression(AsExpression node) {
    final expression = _visitNode(node.expression);
    final type = _visitNode(node.type);

    return TreeNode<AstNode>(
      node,
      children: [
        if (expression != null) expression,
        if (type != null) type,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitAssertInitializer(AssertInitializer node) {
    final condition = _visitNode(node.condition);
    final message = _visitNode(node.message);

    return TreeNode<AstNode>(
      node,
      children: [
        if (condition != null) condition,
        if (message != null) message,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitAssertStatement(AssertStatement node) {
    final condition = _visitNode(node.condition);
    final message = _visitNode(node);

    return TreeNode<AstNode>(
      node,
      children: [
        if (condition != null) condition,
        if (message != null) message,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitAssignedVariablePattern(AssignedVariablePattern node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitAssignmentExpression(AssignmentExpression node) {
    final leftHandSide = _visitNode(node.leftHandSide);
    final rightHandSide = _visitNode(node.rightHandSide);

    return TreeNode<AstNode>(
      node,
      children: [
        if (leftHandSide != null) leftHandSide,
        if (rightHandSide != null) rightHandSide,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitAugmentationImportDirective(AugmentationImportDirective node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitAwaitExpression(AwaitExpression node) {
    final expression = _visitNode(node.expression);

    return TreeNode<AstNode>(
      node,
      children: [
        if (expression != null) expression,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitBinaryExpression(BinaryExpression node) {
    final leftOperand = _visitNode(node.leftOperand);
    final rightOperand = _visitNode(node.rightOperand);

    return TreeNode<AstNode>(
      node,
      children: [
        if (leftOperand != null) leftOperand,
        if (rightOperand != null) rightOperand,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitBlock(Block node) {
    final statements = _visitNodeList(node.statements);

    return TreeNode<AstNode>(
      node,
      children: [
        if (statements != null) ...statements,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitBlockFunctionBody(BlockFunctionBody node) {
    final block = _visitNode(node.block);

    return TreeNode<AstNode>(
      node,
      children: [
        if (block != null) block,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitBooleanLiteral(BooleanLiteral node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitBreakStatement(BreakStatement node) {
    final label = _visitNode(node.label);

    return TreeNode<AstNode>(
      node,
      children: [
        if (label != null) label,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitCascadeExpression(CascadeExpression node) {
    final target = _visitNode(node.target);
    final cascadeSections = _visitNodeList(node.cascadeSections);

    return TreeNode<AstNode>(
      node,
      children: [
        if (target != null) target,
        if (cascadeSections != null) ...cascadeSections,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitCaseClause(CaseClause node) {
    final guardedPattern = _visitNode(node.guardedPattern);

    return TreeNode<AstNode>(
      node,
      children: [
        if (guardedPattern != null) guardedPattern,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitCastPattern(CastPattern node) {
    final type = _visitNode(node.type);
    final pattern = _visitNode(node.pattern);

    return TreeNode<AstNode>(
      node,
      children: [
        if (type != null) type,
        if (pattern != null) pattern,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitCatchClause(CatchClause node) {
    final exceptionType = _visitNode(node.exceptionType);
    final exceptionParameter = _visitNode(node.exceptionParameter);
    final stackTraceParameter = _visitNode(node.stackTraceParameter);
    final body = _visitNode(node.body);

    return TreeNode<AstNode>(
      node,
      children: [
        if (exceptionType != null) exceptionType,
        if (exceptionParameter != null) exceptionParameter,
        if (stackTraceParameter != null) stackTraceParameter,
        if (body != null) body,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitCatchClauseParameter(CatchClauseParameter node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitClassDeclaration(ClassDeclaration node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final typeParameters = _visitNode(node.typeParameters);
    final extendsClause = _visitNode(node.extendsClause);
    final withClause = _visitNode(node.withClause);
    final implementsClause = _visitNode(node.implementsClause);
    final members = _visitNodeList(node.members);

    return TreeNode<AstNode>(
      node,
      children: [
        if (documentationComment != null) documentationComment,
        if (metadata != null) ...metadata,
        if (typeParameters != null) typeParameters,
        if (extendsClause != null) extendsClause,
        if (withClause != null) withClause,
        if (implementsClause != null) implementsClause,
        if (members != null) ...members,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitClassTypeAlias(ClassTypeAlias node) {
    final metadata = _visitNodeList(node.metadata);
    final typeParameters = _visitNode(node.typeParameters);
    final superclass = _visitNode(node.superclass);
    final withClause = _visitNode(node.withClause);
    final implementsClause = _visitNode(node.implementsClause);

    return TreeNode<AstNode>(
      node,
      children: [
        if (metadata != null) ...metadata,
        if (typeParameters != null) typeParameters,
        if (superclass != null) superclass,
        if (withClause != null) withClause,
        if (implementsClause != null) implementsClause,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitComment(Comment node) {
    final references = _visitNodeList(node.references);

    return TreeNode<AstNode>(
      node,
      children: [
        if (references != null) ...references,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitCommentReference(CommentReference node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitCompilationUnit(CompilationUnit node) {
    final directives = _visitNodeList(node.directives);
    final declarations = _visitNodeList(node.declarations);

    return TreeNode<AstNode>(
      node,
      children: [
        if (directives != null) ...directives,
        if (declarations != null) ...declarations,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitConditionalExpression(ConditionalExpression node) {
    final condition = _visitNode(node.condition);
    final thenExpression = _visitNode(node.thenExpression);
    final elseExpression = _visitNode(node.elseExpression);

    return TreeNode<AstNode>(
      node,
      children: [
        if (condition != null) condition,
        if (thenExpression != null) thenExpression,
        if (elseExpression != null) elseExpression,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitConfiguration(Configuration node) {
    final name = _visitNode(node.name);
    final value = _visitNode(node.value);
    final uri = _visitNode(node.uri);

    return TreeNode<AstNode>(
      node,
      children: [
        if (name != null) name,
        if (value != null) value,
        if (uri != null) uri,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitConstantPattern(ConstantPattern node) {
    final expression = _visitNode(node.expression);

    return TreeNode<AstNode>(
      node,
      children: [
        if (expression != null) expression,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitConstructorDeclaration(ConstructorDeclaration node) {
    final comment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final returnType = _visitNode(node.returnType);
    final parameters = _visitNode(node.parameters);
    final initializers = _visitNodeList(node.initializers);
    final redirectedConstructor = _visitNode(node.redirectedConstructor);
    final body = _visitNode(node.body);

    return TreeNode<AstNode>(
      node,
      children: [
        if (comment != null) comment,
        if (metadata != null) ...metadata,
        if (returnType != null) returnType,
        if (parameters != null) parameters,
        if (initializers != null) ...initializers,
        if (redirectedConstructor != null) redirectedConstructor,
        if (body != null) body,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitConstructorFieldInitializer(ConstructorFieldInitializer node) {
    final fieldName = _visitNode(node.fieldName);
    final expression = _visitNode(node.expression);

    return TreeNode<AstNode>(
      node,
      children: [
        if (fieldName != null) fieldName,
        if (expression != null) expression,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitConstructorName(ConstructorName node) {
    final type = _visitNode(node.type);
    final name = _visitNode(node.name);

    return TreeNode<AstNode>(
      node,
      children: [
        if (type != null) type,
        if (name != null) name,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitConstructorReference(ConstructorReference node) {
    final constructorName = _visitNode(node.constructorName);

    return TreeNode<AstNode>(
      node,
      children: [
        if (constructorName != null) constructorName,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitConstructorSelector(ConstructorSelector node) {
    final name = _visitNode(node.name);

    return TreeNode<AstNode>(
      node,
      children: [
        if (name != null) name,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitContinueStatement(ContinueStatement node) {
    final label = _visitNode(node.label);

    return TreeNode<AstNode>(
      node,
      children: [
        if (label != null) label,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitDeclaredIdentifier(DeclaredIdentifier node) {
    final type = _visitNode(node.type);

    return TreeNode<AstNode>(
      node,
      children: [
        if (type != null) type,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitDeclaredVariablePattern(DeclaredVariablePattern node) {
    final type = _visitNode(node.type);

    return TreeNode<AstNode>(
      node,
      children: [
        if (type != null) type,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitDefaultFormalParameter(DefaultFormalParameter node) {
    final metadata = _visitNodeList(node.metadata);
    final parameter = _visitNode(node.parameter);
    final defaultValue = _visitNode(node.defaultValue);

    return TreeNode<AstNode>(
      node,
      children: [
        if (metadata != null) ...metadata,
        if (parameter != null) parameter,
        if (defaultValue != null) defaultValue,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitDoStatement(DoStatement node) {
    final body = _visitNode(node.body);
    final condition = _visitNode(node.condition);

    return TreeNode<AstNode>(
      node,
      children: [
        if (body != null) body,
        if (condition != null) condition,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitDottedName(DottedName node) {
    final components = _visitNodeList(node.components);

    return TreeNode<AstNode>(
      node,
      children: [
        if (components != null) ...components,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitDoubleLiteral(DoubleLiteral node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitEmptyFunctionBody(EmptyFunctionBody node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitEmptyStatement(EmptyStatement node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitEnumConstantArguments(EnumConstantArguments node) {
    final typeArguments = _visitNode(node.typeArguments);
    final argumentList = _visitNode(node.argumentList);

    return TreeNode<AstNode>(
      node,
      children: [
        if (typeArguments != null) typeArguments,
        if (argumentList != null) argumentList,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitEnumConstantDeclaration(EnumConstantDeclaration node) {
    final metadata = _visitNodeList(node.metadata);
    final arguments = _visitNode(node.arguments);

    return TreeNode<AstNode>(
      node,
      children: [
        if (metadata != null) ...metadata,
        if (arguments != null) arguments,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitEnumDeclaration(EnumDeclaration node) {
    final metadata = _visitNodeList(node.metadata);
    final typeParameters = _visitNode(node.typeParameters);
    final withClause = _visitNode(node.withClause);
    final implementsClause = _visitNode(node.implementsClause);
    final members = _visitNodeList(node.members);

    return TreeNode<AstNode>(
      node,
      children: [
        if (metadata != null) ...metadata,
        if (typeParameters != null) typeParameters,
        if (withClause != null) withClause,
        if (implementsClause != null) implementsClause,
        if (members != null) ...members,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitExportDirective(ExportDirective node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final uri = _visitNode(node.uri);
    final configurations = _visitNodeList(node.configurations);
    final combinators = _visitNodeList(node.combinators);

    return TreeNode<AstNode>(
      node,
      children: [
        if (documentationComment != null) documentationComment,
        if (metadata != null) ...metadata,
        if (uri != null) uri,
        if (configurations != null) ...configurations,
        if (combinators != null) ...combinators,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitExpressionFunctionBody(ExpressionFunctionBody node) {
    final expression = _visitNode(node.expression);

    return TreeNode<AstNode>(
      node,
      children: [
        if (expression != null) expression,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitExpressionStatement(ExpressionStatement node) {
    final expression = _visitNode(node.expression);

    return TreeNode<AstNode>(
      node,
      children: [
        if (expression != null) expression,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitExtendsClause(ExtendsClause node) {
    final superclass = _visitNode(node.superclass);

    return TreeNode<AstNode>(
      node,
      children: [
        if (superclass != null) superclass,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitExtensionDeclaration(ExtensionDeclaration node) {
    final metadata = _visitNodeList(node.metadata);
    final typeParameters = _visitNode(node.typeParameters);
    final extendedType = _visitNode(node.extendedType);
    final members = _visitNodeList(node.members);

    return TreeNode<AstNode>(
      node,
      children: [
        if (metadata != null) ...metadata,
        if (typeParameters != null) typeParameters,
        if (extendedType != null) extendedType,
        if (members != null) ...members,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitExtensionOverride(ExtensionOverride node) {
    final argumentList = _visitNode(node.argumentList);

    return TreeNode<AstNode>(
      node,
      children: [
        if (argumentList != null) argumentList,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitExtensionTypeDeclaration(ExtensionTypeDeclaration node) {
    final metadata = _visitNodeList(node.metadata);
    final typeParameters = _visitNode(node.typeParameters);
    final members = _visitNodeList(node.members);

    return TreeNode<AstNode>(
      node,
      children: [
        if (metadata != null) ...metadata,
        if (typeParameters != null) typeParameters,
        if (members != null) ...members,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitFieldDeclaration(FieldDeclaration node) {
    final metadata = _visitNodeList(node.metadata);
    final fields = _visitNode(node.fields);

    return TreeNode<AstNode>(
      node,
      children: [
        if (metadata != null) ...metadata,
        if (fields != null) fields,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitFieldFormalParameter(FieldFormalParameter node) {
    final metadata = _visitNodeList(node.metadata);
    final type = _visitNode(node.type);
    final parameters = _visitNode(node.parameters);
    final typeParameters = _visitNode(node.typeParameters);

    return TreeNode<AstNode>(
      node,
      children: [
        if (metadata != null) ...metadata,
        if (type != null) type,
        if (parameters != null) parameters,
        if (typeParameters != null) typeParameters,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitForEachPartsWithDeclaration(ForEachPartsWithDeclaration node) {
    final loopVariable = _visitNode(node.loopVariable);
    final iterable = _visitNode(node.iterable);

    return TreeNode<AstNode>(
      node,
      children: [
        if (loopVariable != null) loopVariable,
        if (iterable != null) iterable,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitForEachPartsWithIdentifier(ForEachPartsWithIdentifier node) {
    final iterable = _visitNode(node.iterable);

    return TreeNode<AstNode>(
      node,
      children: [
        if (iterable != null) iterable,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitForEachPartsWithPattern(ForEachPartsWithPattern node) {
    final iterable = _visitNode(node.iterable);

    return TreeNode<AstNode>(
      node,
      children: [
        if (iterable != null) iterable,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitForElement(ForElement node) {
    final forLoopParts = _visitNode(node.forLoopParts);
    final body = _visitNode(node.body);

    return TreeNode<AstNode>(
      node,
      children: [
        if (forLoopParts != null) forLoopParts,
        if (body != null) body,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitFormalParameterList(FormalParameterList node) {
    final parameters = _visitNodeList(node.parameters);

    return TreeNode<AstNode>(
      node,
      children: [
        if (parameters != null) ...parameters,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitForPartsWithDeclarations(ForPartsWithDeclarations node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitForPartsWithExpression(ForPartsWithExpression node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitForPartsWithPattern(ForPartsWithPattern node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitForStatement(ForStatement node) {
    final forLoopParts = _visitNode(node.forLoopParts);
    final body = _visitNode(node.body);

    return TreeNode<AstNode>(
      node,
      children: [
        if (forLoopParts != null) forLoopParts,
        if (body != null) body,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitFunctionDeclaration(FunctionDeclaration node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final returnType = _visitNode(node.returnType);
    final functionExpression = _visitNode(node.functionExpression);

    return TreeNode<AstNode>(
      node,
      children: [
        if (documentationComment != null) documentationComment,
        if (metadata != null) ...metadata,
        if (returnType != null) returnType,
        if (functionExpression != null) functionExpression,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitFunctionDeclarationStatement(FunctionDeclarationStatement node) {
    final functionDeclaration = _visitNode(node.functionDeclaration);

    return TreeNode<AstNode>(
      node,
      children: [
        if (functionDeclaration != null) functionDeclaration,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitFunctionExpression(FunctionExpression node) {
    final parameters = _visitNode(node.parameters);
    final body = _visitNode(node.body);

    return TreeNode<AstNode>(
      node,
      children: [
        if (parameters != null) parameters,
        if (body != null) body,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitFunctionExpressionInvocation(FunctionExpressionInvocation node) {
    final function = _visitNode(node.function);
    final argumentList = _visitNode(node.argumentList);

    return TreeNode<AstNode>(
      node,
      children: [
        if (function != null) function,
        if (argumentList != null) argumentList,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitFunctionReference(FunctionReference node) {
    final function = _visitNode(node.function);

    return TreeNode<AstNode>(
      node,
      children: [
        if (function != null) function,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitFunctionTypeAlias(FunctionTypeAlias node) {
    final metadata = _visitNodeList(node.metadata);
    final returnType = _visitNode(node.returnType);
    final typeParameters = _visitNode(node.typeParameters);
    final parameters = _visitNode(node.parameters);

    return TreeNode<AstNode>(
      node,
      children: [
        if (metadata != null) ...metadata,
        if (returnType != null) returnType,
        if (typeParameters != null) typeParameters,
        if (parameters != null) parameters,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitFunctionTypedFormalParameter(FunctionTypedFormalParameter node) {
    final metadata = _visitNodeList(node.metadata);
    final returnType = _visitNode(node.returnType);
    final parameters = _visitNode(node.parameters);

    return TreeNode<AstNode>(
      node,
      children: [
        if (metadata != null) ...metadata,
        if (returnType != null) returnType,
        if (parameters != null) parameters,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitGenericFunctionType(GenericFunctionType node) {
    final typeParameters = _visitNode(node.typeParameters);
    final parameters = _visitNode(node.parameters);
    final returnType = _visitNode(node.returnType);

    return TreeNode<AstNode>(
      node,
      children: [
        if (typeParameters != null) typeParameters,
        if (parameters != null) parameters,
        if (returnType != null) returnType,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitGenericTypeAlias(GenericTypeAlias node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final typeParameters = _visitNode(node.typeParameters);
    final type = _visitNode(node.type);

    return TreeNode<AstNode>(
      node,
      children: [
        if (documentationComment != null) documentationComment,
        if (metadata != null) ...metadata,
        if (typeParameters != null) typeParameters,
        if (type != null) type,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitGuardedPattern(GuardedPattern node) {
    final pattern = _visitNode(node.pattern);
    final whenClause = _visitNode(node.whenClause);

    return TreeNode<AstNode>(
      node,
      children: [
        if (pattern != null) pattern,
        if (whenClause != null) whenClause,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitHideCombinator(HideCombinator node) {
    final hiddenNames = _visitNodeList(node.hiddenNames);

    return TreeNode<AstNode>(
      node,
      children: [
        if (hiddenNames != null) ...hiddenNames,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitIfElement(IfElement node) {
    final expression = _visitNode(node.expression);
    final thenElement = _visitNode(node.thenElement);
    final elseElement = _visitNode(node.elseElement);

    return TreeNode<AstNode>(
      node,
      children: [
        if (expression != null) expression,
        if (thenElement != null) thenElement,
        if (elseElement != null) elseElement,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitIfStatement(IfStatement node) {
    final expression = _visitNode(node.expression);
    final caseClause = _visitNode(node.caseClause);
    final thenStatement = _visitNode(node.thenStatement);
    final elseStatement = _visitNode(node.elseStatement);

    return TreeNode<AstNode>(
      node,
      children: [
        if (expression != null) expression,
        if (caseClause != null) caseClause,
        if (thenStatement != null) thenStatement,
        if (elseStatement != null) elseStatement,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitImplementsClause(ImplementsClause node) {
    final interfaces = _visitNodeList(node.interfaces);

    return TreeNode<AstNode>(
      node,
      children: [
        if (interfaces != null) ...interfaces,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitImplicitCallReference(ImplicitCallReference node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitImportDirective(ImportDirective node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final uri = _visitNode(node.uri);
    final prefix = _visitNode(node.prefix);
    final configurations = _visitNodeList(node.configurations);
    final combinators = _visitNodeList(node.combinators);

    return TreeNode<AstNode>(
      node,
      children: [
        if (documentationComment != null) documentationComment,
        if (metadata != null) ...metadata,
        if (uri != null) uri,
        if (prefix != null) prefix,
        if (configurations != null) ...configurations,
        if (combinators != null) ...combinators,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitImportPrefixReference(ImportPrefixReference node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitIndexExpression(IndexExpression node) {
    final target = _visitNode(node.target);
    final index = _visitNode(node.index);

    return TreeNode<AstNode>(
      node,
      children: [
        if (target != null) target,
        if (index != null) index,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitInstanceCreationExpression(InstanceCreationExpression node) {
    final constructorName = _visitNode(node.constructorName);
    final argumentList = _visitNode(node.argumentList);

    return TreeNode<AstNode>(
      node,
      children: [
        if (constructorName != null) constructorName,
        if (argumentList != null) argumentList,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitIntegerLiteral(IntegerLiteral node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitInterpolationExpression(InterpolationExpression node) {
    final expression = _visitNode(node.expression);

    return TreeNode<AstNode>(
      node,
      children: [
        if (expression != null) expression,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitInterpolationString(InterpolationString node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitIsExpression(IsExpression node) {
    final expression = _visitNode(node.expression);
    final type = _visitNode(node.type);

    return TreeNode<AstNode>(
      node,
      children: [
        if (expression != null) expression,
        if (type != null) type,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitLabel(Label node) {
    final label = _visitNode(node.label);

    return TreeNode<AstNode>(
      node,
      children: [
        if (label != null) label,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitLabeledStatement(LabeledStatement node) {
    final statement = _visitNode(node.statement);

    return TreeNode<AstNode>(
      node,
      children: [
        if (statement != null) statement,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitLibraryAugmentationDirective(LibraryAugmentationDirective node) {
    final uri = _visitNode(node.uri);

    return TreeNode<AstNode>(
      node,
      children: [
        if (uri != null) uri,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitLibraryDirective(LibraryDirective node) {
    final metadata = _visitNodeList(node.metadata);

    return TreeNode<AstNode>(
      node,
      children: [
        if (metadata != null) ...metadata,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitLibraryIdentifier(LibraryIdentifier node) {
    final components = _visitNodeList(node.components);

    return TreeNode<AstNode>(
      node,
      children: [
        if (components != null) ...components,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitListLiteral(ListLiteral node) {
    final elements = _visitNodeList(node.elements);

    return TreeNode<AstNode>(
      node,
      children: [
        if (elements != null) ...elements,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitListPattern(ListPattern node) {
    final elements = _visitNodeList(node.elements);

    return TreeNode<AstNode>(
      node,
      children: [
        if (elements != null) ...elements,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitLogicalAndPattern(LogicalAndPattern node) {
    final leftOperand = _visitNode(node.leftOperand);
    final rightOperand = _visitNode(node.rightOperand);

    return TreeNode<AstNode>(
      node,
      children: [
        if (leftOperand != null) leftOperand,
        if (rightOperand != null) rightOperand,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitLogicalOrPattern(LogicalOrPattern node) {
    final leftOperand = _visitNode(node.leftOperand);
    final rightOperand = _visitNode(node.rightOperand);

    return TreeNode<AstNode>(
      node,
      children: [
        if (leftOperand != null) leftOperand,
        if (rightOperand != null) rightOperand,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitMapLiteralEntry(MapLiteralEntry node) {
    final key = _visitNode(node.key);
    final value = _visitNode(node.value);

    return TreeNode<AstNode>(
      node,
      children: [
        if (key != null) key,
        if (value != null) value,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitMapPattern(MapPattern node) {
    final elements = _visitNodeList(node.elements);

    return TreeNode<AstNode>(
      node,
      children: [
        if (elements != null) ...elements,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitMapPatternEntry(MapPatternEntry node) {
    final key = _visitNode(node.key);
    final value = _visitNode(node.value);

    return TreeNode<AstNode>(
      node,
      children: [
        if (key != null) key,
        if (value != null) value,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitMethodDeclaration(MethodDeclaration node) {
    final metadata = _visitNodeList(node.metadata);
    final returnType = _visitNode(node.returnType);
    final parameters = _visitNode(node.parameters);
    final body = _visitNode(node.body);
    final typeParameters = _visitNode(node.typeParameters);
    final documentationComment = _visitNode(node.documentationComment);

    return TreeNode<AstNode>(
      node,
      children: [
        if (metadata != null) ...metadata,
        if (returnType != null) returnType,
        if (parameters != null) parameters,
        if (body != null) body,
        if (typeParameters != null) typeParameters,
        if (documentationComment != null) documentationComment,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitMethodInvocation(MethodInvocation node) {
    final target = _visitNode(node.target);
    final methodName = _visitNode(node.methodName);
    final typeArguments = _visitNode(node.typeArguments);
    final argumentList = _visitNode(node.argumentList);

    return TreeNode<AstNode>(
      node,
      children: [
        if (target != null) target,
        if (methodName != null) methodName,
        if (typeArguments != null) typeArguments,
        if (argumentList != null) argumentList,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitMixinDeclaration(MixinDeclaration node) {
    final metadata = _visitNodeList(node.metadata);
    final typeParameters = _visitNode(node.typeParameters);
    final onClause = _visitNode(node.onClause);
    final members = _visitNodeList(node.members);

    return TreeNode<AstNode>(
      node,
      children: [
        if (metadata != null) ...metadata,
        if (typeParameters != null) typeParameters,
        if (onClause != null) onClause,
        if (members != null) ...members,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitNamedExpression(NamedExpression node) {
    final expression = _visitNode(node.expression);

    return TreeNode<AstNode>(
      node,
      children: [
        if (expression != null) expression,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitNamedType(NamedType node) {
    final importPrefix = _visitNode(node.importPrefix);
    final typeArguments = _visitNode(node.typeArguments);

    return TreeNode<AstNode>(
      node,
      children: [
        if (importPrefix != null) importPrefix,
        if (typeArguments != null) typeArguments,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitNativeClause(NativeClause node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitNativeFunctionBody(NativeFunctionBody node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitNullAssertPattern(NullAssertPattern node) {
    final pattern = _visitNode(node.pattern);

    return TreeNode<AstNode>(
      node,
      children: [
        if (pattern != null) pattern,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitNullCheckPattern(NullCheckPattern node) {
    final pattern = _visitNode(node.pattern);

    return TreeNode<AstNode>(
      node,
      children: [
        if (pattern != null) pattern,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitNullLiteral(NullLiteral node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitObjectPattern(ObjectPattern node) {
    final fields = _visitNodeList(node.fields);

    return TreeNode<AstNode>(
      node,
      children: [
        if (fields != null) ...fields,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitOnClause(OnClause node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitParenthesizedExpression(ParenthesizedExpression node) {
    final expression = _visitNode(node.expression);

    return TreeNode<AstNode>(
      node,
      children: [
        if (expression != null) expression,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitParenthesizedPattern(ParenthesizedPattern node) {
    final pattern = _visitNode(node.pattern);

    return TreeNode<AstNode>(
      node,
      children: [
        if (pattern != null) pattern,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitPartDirective(PartDirective node) {
    final uri = _visitNode(node.uri);

    return TreeNode<AstNode>(
      node,
      children: [
        if (uri != null) uri,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitPartOfDirective(PartOfDirective node) {
    final uri = _visitNode(node.uri);

    return TreeNode<AstNode>(
      node,
      children: [
        if (uri != null) uri,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitPatternAssignment(PatternAssignment node) {
    final pattern = _visitNode(node.pattern);

    return TreeNode<AstNode>(
      node,
      children: [
        if (pattern != null) pattern,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitPatternField(PatternField node) {
    final pattern = _visitNode(node.pattern);

    return TreeNode<AstNode>(
      node,
      children: [
        if (pattern != null) pattern,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitPatternFieldName(PatternFieldName node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitPatternVariableDeclaration(PatternVariableDeclaration node) {
    final pattern = _visitNode(node.pattern);
    final expression = _visitNode(node.expression);

    return TreeNode<AstNode>(
      node,
      children: [
        if (pattern != null) pattern,
        if (expression != null) expression,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitPatternVariableDeclarationStatement(PatternVariableDeclarationStatement node) {
    final declaration = _visitNode(node.declaration);

    return TreeNode<AstNode>(
      node,
      children: [
        if (declaration != null) declaration,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitPostfixExpression(PostfixExpression node) {
    final operand = _visitNode(node.operand);

    return TreeNode<AstNode>(
      node,
      children: [
        if (operand != null) operand,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitPrefixedIdentifier(PrefixedIdentifier node) {
    final prefix = _visitNode(node.prefix);
    final identifier = _visitNode(node.identifier);

    return TreeNode<AstNode>(
      node,
      children: [
        if (prefix != null) prefix,
        if (identifier != null) identifier,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitPrefixExpression(PrefixExpression node) {
    final operand = _visitNode(node.operand);

    return TreeNode<AstNode>(
      node,
      children: [
        if (operand != null) operand,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitPropertyAccess(PropertyAccess node) {
    final target = _visitNode(node.target);
    final propertyName = _visitNode(node.propertyName);

    return TreeNode<AstNode>(
      node,
      children: [
        if (target != null) target,
        if (propertyName != null) propertyName,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitRecordLiteral(RecordLiteral node) {
    final fields = _visitNodeList(node.fields);

    return TreeNode<AstNode>(
      node,
      children: [
        if (fields != null) ...fields,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitRecordPattern(RecordPattern node) {
    final fields = _visitNodeList(node.fields);

    return TreeNode<AstNode>(
      node,
      children: [
        if (fields != null) ...fields,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitRecordTypeAnnotation(RecordTypeAnnotation node) {
    final positionalFields = _visitNodeList(node.positionalFields);

    return TreeNode<AstNode>(
      node,
      children: [
        if (positionalFields != null) ...positionalFields,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitRecordTypeAnnotationNamedField(RecordTypeAnnotationNamedField node) {
    final type = _visitNode(node.type);

    return TreeNode<AstNode>(
      node,
      children: [
        if (type != null) type,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitRecordTypeAnnotationNamedFields(RecordTypeAnnotationNamedFields node) {
    final fields = _visitNodeList(node.fields);

    return TreeNode<AstNode>(
      node,
      children: [
        if (fields != null) ...fields,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitRecordTypeAnnotationPositionalField(RecordTypeAnnotationPositionalField node) {
    final type = _visitNode(node.type);

    return TreeNode<AstNode>(
      node,
      children: [
        if (type != null) type,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitRedirectingConstructorInvocation(RedirectingConstructorInvocation node) {
    final argumentList = _visitNode(node.argumentList);
    final constructorName = _visitNode(node.constructorName);

    return TreeNode<AstNode>(
      node,
      children: [
        if (argumentList != null) argumentList,
        if (constructorName != null) constructorName,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitRelationalPattern(RelationalPattern node) {
    final operand = _visitNode(node.operand);

    return TreeNode<AstNode>(
      node,
      children: [
        if (operand != null) operand,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitRepresentationConstructorName(RepresentationConstructorName node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitRepresentationDeclaration(RepresentationDeclaration node) {
    final fieldMetadata = _visitNodeList(node.fieldMetadata);
    final constructorName = _visitNode(node.constructorName);

    return TreeNode<AstNode>(
      node,
      children: [
        if (fieldMetadata != null) ...fieldMetadata,
        if (constructorName != null) constructorName,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitRestPatternElement(RestPatternElement node) {
    final pattern = _visitNode(node.pattern);

    return TreeNode<AstNode>(
      node,
      children: [
        if (pattern != null) pattern,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitRethrowExpression(RethrowExpression node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitReturnStatement(ReturnStatement node) {
    final expression = _visitNode(node.expression);

    return TreeNode<AstNode>(
      node,
      children: [
        if (expression != null) expression,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitScriptTag(ScriptTag node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitSetOrMapLiteral(SetOrMapLiteral node) {
    final elements = _visitNodeList(node.elements);
    final typeArguments = _visitNode(node.typeArguments);

    return TreeNode<AstNode>(
      node,
      children: [
        if (elements != null) ...elements,
        if (typeArguments != null) typeArguments,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitShowCombinator(ShowCombinator node) {
    final shownNames = _visitNodeList(node.shownNames);

    return TreeNode<AstNode>(
      node,
      children: [
        if (shownNames != null) ...shownNames,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitSimpleFormalParameter(SimpleFormalParameter node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final type = _visitNode(node.type);

    return TreeNode<AstNode>(
      node,
      children: [
        if (documentationComment != null) documentationComment,
        if (metadata != null) ...metadata,
        if (type != null) type,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitSimpleIdentifier(SimpleIdentifier node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitSimpleStringLiteral(SimpleStringLiteral node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitSpreadElement(SpreadElement node) {
    final expression = _visitNode(node.expression);

    return TreeNode<AstNode>(
      node,
      children: [
        if (expression != null) expression,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitStringInterpolation(StringInterpolation node) {
    final elements = _visitNodeList(node.elements);

    return TreeNode<AstNode>(
      node,
      children: [
        if (elements != null) ...elements,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitSuperConstructorInvocation(SuperConstructorInvocation node) {
    final argumentList = _visitNode(node.argumentList);
    final constructorName = _visitNode(node.constructorName);

    return TreeNode<AstNode>(
      node,
      children: [
        if (argumentList != null) argumentList,
        if (constructorName != null) constructorName,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitSuperExpression(SuperExpression node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitSuperFormalParameter(SuperFormalParameter node) {
    final type = _visitNode(node.type);
    final parameters = _visitNode(node.parameters);

    return TreeNode<AstNode>(
      node,
      children: [
        if (type != null) type,
        if (parameters != null) parameters,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitSwitchCase(SwitchCase node) {
    final expression = _visitNode(node.expression);
    final statements = _visitNodeList(node.statements);

    return TreeNode<AstNode>(
      node,
      children: [
        if (expression != null) expression,
        if (statements != null) ...statements,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitSwitchDefault(SwitchDefault node) {
    final statements = _visitNodeList(node.statements);

    return TreeNode<AstNode>(
      node,
      children: [
        if (statements != null) ...statements,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitSwitchExpression(SwitchExpression node) {
    final expression = _visitNode(node.expression);
    final cases = _visitNodeList(node.cases);

    return TreeNode<AstNode>(
      node,
      children: [
        if (expression != null) expression,
        if (cases != null) ...cases,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitSwitchExpressionCase(SwitchExpressionCase node) {
    final guardedPattern = _visitNode(node.guardedPattern);
    final expression = _visitNode(node.expression);

    return TreeNode<AstNode>(
      node,
      children: [
        if (guardedPattern != null) guardedPattern,
        if (expression != null) expression,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitSwitchPatternCase(SwitchPatternCase node) {
    final labels = _visitNodeList(node.labels);
    final guardedPattern = _visitNode(node.guardedPattern);
    final statements = _visitNodeList(node.statements);

    return TreeNode<AstNode>(
      node,
      children: [
        if (labels != null) ...labels,
        if (guardedPattern != null) guardedPattern,
        if (statements != null) ...statements,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitSwitchStatement(SwitchStatement node) {
    final expression = _visitNode(node.expression);
    final members = _visitNodeList(node.members);

    return TreeNode<AstNode>(
      node,
      children: [
        if (expression != null) expression,
        if (members != null) ...members,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitSymbolLiteral(SymbolLiteral node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitThisExpression(ThisExpression node) {
    return TreeNode<AstNode>(
      node,
    );
  }

  @override
  TreeNode<AstNode>? visitThrowExpression(ThrowExpression node) {
    final expression = _visitNode(node.expression);

    return TreeNode<AstNode>(
      node,
      children: [
        if (expression != null) expression,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitTopLevelVariableDeclaration(TopLevelVariableDeclaration node) {
    final metadata = _visitNodeList(node.metadata);
    final variables = _visitNode(node.variables);

    return TreeNode<AstNode>(
      node,
      children: [
        if (metadata != null) ...metadata,
        if (variables != null) variables,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitTryStatement(TryStatement node) {
    final body = _visitNode(node.body);
    final catchClauses = _visitNodeList(node.catchClauses);
    final finallyBlock = _visitNode(node.finallyBlock);

    return TreeNode<AstNode>(
      node,
      children: [
        if (body != null) body,
        if (catchClauses != null) ...catchClauses,
        if (finallyBlock != null) finallyBlock,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitTypeArgumentList(TypeArgumentList node) {
    final arguments = _visitNodeList(node.arguments);

    return TreeNode<AstNode>(
      node,
      children: [
        if (arguments != null) ...arguments,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitTypeLiteral(TypeLiteral node) {
    final type = _visitNode(node.type);

    return TreeNode<AstNode>(
      node,
      children: [
        if (type != null) type,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitTypeParameter(TypeParameter node) {
    final metadata = _visitNodeList(node.metadata);
    final bound = _visitNode(node.bound);

    return TreeNode<AstNode>(
      node,
      children: [
        if (metadata != null) ...metadata,
        if (bound != null) bound,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitTypeParameterList(TypeParameterList node) {
    final typeParameters = _visitNodeList(node.typeParameters);

    return TreeNode<AstNode>(
      node,
      children: [
        if (typeParameters != null) ...typeParameters,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitVariableDeclaration(VariableDeclaration node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final initializer = _visitNode(node.initializer);

    return TreeNode<AstNode>(
      node,
      children: [
        if (documentationComment != null) documentationComment,
        if (metadata != null) ...metadata,
        if (initializer != null) initializer,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitVariableDeclarationList(VariableDeclarationList node) {
    final documentationComment = _visitNode(node.documentationComment);
    final metadata = _visitNodeList(node.metadata);
    final type = _visitNode(node.type);
    final variables = _visitNodeList(node.variables);

    return TreeNode<AstNode>(
      node,
      children: [
        if (documentationComment != null) documentationComment,
        if (metadata != null) ...metadata,
        if (type != null) type,
        if (variables != null) ...variables,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitVariableDeclarationStatement(VariableDeclarationStatement node) {
    final variables = _visitNode(node.variables);

    return TreeNode<AstNode>(
      node,
      children: [
        if (variables != null) variables,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitWhenClause(WhenClause node) {
    final expression = _visitNode(node.expression);

    return TreeNode<AstNode>(
      node,
      children: [
        if (expression != null) expression,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitWhileStatement(WhileStatement node) {
    final condition = _visitNode(node.condition);
    final body = _visitNode(node.body);

    return TreeNode<AstNode>(
      node,
      children: [
        if (condition != null) condition,
        if (body != null) body,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitWildcardPattern(WildcardPattern node) {
    final type = _visitNode(node.type);

    return TreeNode<AstNode>(
      node,
      children: [
        if (type != null) type,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitWithClause(WithClause node) {
    final mixinTypes = _visitNodeList(node.mixinTypes);

    return TreeNode<AstNode>(
      node,
      children: [
        if (mixinTypes != null) ...mixinTypes,
      ],
    );
  }

  @override
  TreeNode<AstNode>? visitYieldStatement(YieldStatement node) {
    final expression = _visitNode(node.expression);

    return TreeNode<AstNode>(
      node,
      children: [
        if (expression != null) expression,
      ],
    );
  }
}
