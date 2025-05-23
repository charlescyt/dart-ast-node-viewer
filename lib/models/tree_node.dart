import 'package:meta/meta.dart' show immutable;

@immutable
class TreeNode<T> {
  final T value;
  final List<TreeNode<T>> children;

  const TreeNode(
    this.value, {
    List<TreeNode<T>>? children,
  }) : children = children ?? const [];

  bool get hasChildren => children.isNotEmpty;
  bool get isLeaf => !hasChildren;

  @override
  String toString() {
    if (children.isEmpty) {
      return '(node: $value)';
    }

    return '(node: $value, children: $children)';
  }
}
