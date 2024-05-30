import 'package:analyzer/dart/ast/ast.dart';

/// Format the runtime type of a Dart AST node.
///
/// This function strips off the trailing 'Impl' from the runtime type
/// of a Dart AST node. It returns the stripped string as the formatted
/// runtime type.
///
/// For example, if the runtime type of a node is `MethodInvocationImpl`,
/// this function will return `MethodInvocation`.
String formatAstNodeRuntimeType(AstNode node) {
  final runtimeTypeString = node.runtimeType.toString();
  final formattedString = runtimeTypeString.substring(0, runtimeTypeString.length - 4);

  return formattedString;
}
