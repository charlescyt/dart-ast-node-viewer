import 'package:flutter/material.dart';

class AppDecoratedBox extends StatelessWidget {
  const AppDecoratedBox({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(8.0),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: theme.dividerColor)),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
