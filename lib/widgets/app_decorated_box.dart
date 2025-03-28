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

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        border: Border.fromBorderSide(BorderSide(color: theme.dividerColor)),
      ),
      child: child,
    );
  }
}
