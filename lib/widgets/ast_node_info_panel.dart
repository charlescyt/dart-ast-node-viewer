import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/syntactic_entity.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../models/ast_node_info.dart';
import '../utils/utils.dart';
import 'app_panel.dart';

class AstNodeInfoPanel extends StatelessWidget {
  const AstNodeInfoPanel({
    super.key,
    required this.node,
    required this.onSyntacticEntitySelected,
    this.hideNullNode = true,
    this.hideEmptyNodeList = true,
    this.hideNullToken = true,
  });

  final AstNode node;
  final bool hideNullNode;
  final bool hideEmptyNodeList;
  final bool hideNullToken;
  final void Function(SyntacticEntity entity) onSyntacticEntitySelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return AppPanel(
      title: Text(getAstNodeTypeName(node)),
      trailing: Link(
        target: LinkTarget.blank,
        uri: node.url,
        builder: (context, followLink) {
          return IconButton(
            icon: const Icon(Icons.description_outlined),
            onPressed: followLink,
          );
        },
      ),
      // ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              subtitleTextStyle: textTheme.bodyMedium!.copyWith(color: colorScheme.primary),
              title: Text(
                node.toSource(),
                maxLines: 10,
              ),
              subtitle: const Text('.toSource()'),
            ),
            const Divider(height: 1.0),
            AstNodeInfoView(
              info: AstNodeInfo.fromAstNode(node),
              hideNullNode: hideNullNode,
              hideEmptyNodeList: hideEmptyNodeList,
              hideNullToken: hideNullToken,
              onSyntacticEntityTap: onSyntacticEntitySelected,
            ),
          ],
        ),
      ),
    );
  }
}

class AstNodeInfoView extends StatelessWidget {
  const AstNodeInfoView({
    super.key,
    required this.info,
    this.hideNullNode = true,
    this.hideEmptyNodeList = true,
    this.hideNullToken = true,
    required this.onSyntacticEntityTap,
  });

  final AstNodeInfo info;
  final bool hideNullNode;
  final bool hideEmptyNodeList;
  final bool hideNullToken;
  final void Function(SyntacticEntity entity) onSyntacticEntityTap;

  @override
  Widget build(BuildContext context) {
    var nodeEntries = <NodeEntry>[...info.nodeEntries];
    if (hideNullNode) {
      nodeEntries = nodeEntries
          .where(
            (entry) =>
                (entry is NodeListEntry) || //
                (entry is SingleNodeEntry && entry.node != null),
          )
          .toList();
    }
    if (hideEmptyNodeList) {
      nodeEntries = nodeEntries
          .where(
            (entry) =>
                (entry is SingleNodeEntry) || //
                (entry is NodeListEntry && entry.nodeList.isNotEmpty),
          )
          .toList();
    }

    var tokenEntries = <TokenEntry>[...info.tokenEntries];
    if (hideNullToken) {
      tokenEntries = tokenEntries.where((entry) => entry.token != null).toList();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final entry in nodeEntries)
          switch (entry) {
            SingleNodeEntry(:final label, :final node) => NodeTile(
                label: label,
                node: node,
                onTap: () {
                  if (node == null) return;
                  onSyntacticEntityTap(node);
                },
              ),
            NodeListEntry(:final label, :final nodeList) => NodeListTile(
                label: label,
                nodeList: nodeList,
                onTap: onSyntacticEntityTap,
              ),
          },
        if (tokenEntries.isNotEmpty) //
          const Divider(height: 1),
        for (final entry in tokenEntries) //
          TokenTile(
            label: entry.label,
            token: entry.token,
          ),
        if (info.propertyEntries.isNotEmpty) //
          const Divider(height: 1),
        for (final entry in info.propertyEntries) //
          PropertyTile(
            label: entry.label,
            property: entry.value,
          ),
      ],
    );
  }
}

class NodeTile extends StatelessWidget {
  const NodeTile({
    super.key,
    required this.label,
    required this.node,
    required this.onTap,
  });

  final String label;
  final AstNode? node;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return ListTile(
      onTap: onTap,
      titleTextStyle: textTheme.bodyLarge!.copyWith(
        color: node == null ? colorScheme.secondary : null,
        overflow: TextOverflow.ellipsis,
      ),
      subtitleTextStyle: textTheme.bodyMedium!.copyWith(
        color: colorScheme.primary,
        overflow: TextOverflow.ellipsis,
      ),
      title: Text(node?.toSource() ?? 'null'),
      subtitle: Text('.$label'),
      trailing: node == null ? null : Text(getAstNodeTypeName(node!)),
    );
  }
}

class NodeListTile extends StatelessWidget {
  const NodeListTile({
    super.key,
    required this.label,
    required this.nodeList,
    required this.onTap,
  });

  final String label;
  final NodeList nodeList;
  final void Function(SyntacticEntity entity)? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    if (nodeList.isEmpty) {
      return ListTile(
        titleTextStyle: textTheme.bodyLarge!.copyWith(
          color: nodeList.isEmpty ? colorScheme.secondary : null,
          overflow: TextOverflow.ellipsis,
        ),
        subtitleTextStyle: textTheme.bodyMedium!.copyWith(
          color: colorScheme.primary,
          overflow: TextOverflow.ellipsis,
        ),
        title: const Text('empty'),
        subtitle: Text('.$label'),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final (index, node) in nodeList.indexed)
          NodeTile(
            label: '$label[$index]',
            node: node,
            onTap: () => onTap?.call(node),
          ),
      ],
    );
  }
}

class TokenTile extends StatelessWidget {
  const TokenTile({
    super.key,
    required this.label,
    required this.token,
  });

  final String label;
  final Token? token;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return ListTile(
      titleTextStyle: textTheme.bodyLarge!.copyWith(
        color: token == null ? colorScheme.secondary : null,
        overflow: TextOverflow.ellipsis,
      ),
      subtitleTextStyle: textTheme.bodyMedium!.copyWith(
        color: colorScheme.primary,
        overflow: TextOverflow.ellipsis,
      ),
      title: Text(token?.lexeme ?? 'null'),
      subtitle: Text('.$label'),
    );
  }
}

class PropertyTile<T extends Object?> extends StatelessWidget {
  const PropertyTile({
    super.key,
    required this.label,
    required this.property,
  });

  final String label;
  final T property;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return ListTile(
      titleTextStyle: textTheme.bodyLarge!.copyWith(
        color: property == null ? colorScheme.secondary : null,
        overflow: TextOverflow.ellipsis,
      ),
      subtitleTextStyle: textTheme.bodyMedium!.copyWith(
        color: colorScheme.primary,
        overflow: TextOverflow.ellipsis,
      ),
      title: Text(property.toString()),
      subtitle: Text('.$label'),
    );
  }
}
