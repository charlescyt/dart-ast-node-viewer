import 'package:flutter/material.dart';

class AppDecoratedBox extends StatelessWidget {
  const AppDecoratedBox({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: theme.dividerColor)),
      ),
      child: child,
    );
  }
}
