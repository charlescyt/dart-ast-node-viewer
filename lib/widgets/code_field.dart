import 'package:flutter/material.dart';
import 'package:re_editor/re_editor.dart';
import 'package:re_highlight/languages/dart.dart';

import 'app_decorated_box.dart';

class CodeField extends StatefulWidget {
  const CodeField({
    super.key,
    this.readOnly = false,
    this.wordWrap = false,
    this.controller,
    this.onContentChanged,
    required this.theme,
  });

  final bool readOnly;
  final bool wordWrap;
  final CodeLineEditingController? controller;
  final ValueChanged<String>? onContentChanged;
  final Map<String, TextStyle> theme;

  @override
  State<CodeField> createState() => _CodeFieldState();
}

class _CodeFieldState extends State<CodeField> {
  late CodeLineEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? CodeLineEditingController();
  }

  @override
  void didUpdateWidget(covariant CodeField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.controller != oldWidget.controller) {
      _controller = widget.controller ?? CodeLineEditingController();
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppDecoratedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CodeEditor(
              controller: _controller,
              readOnly: widget.readOnly,
              wordWrap: widget.wordWrap,
              padding: const EdgeInsets.all(8.0),
              onChanged: (value) => widget.onContentChanged?.call(value.codeLines.asString(TextLineBreak.lf)),
              style: CodeEditorStyle(
                fontSize: 14.0,
                fontFamily: 'JetBrainsMono',
                codeTheme: CodeHighlightTheme(
                  languages: {'dart': CodeHighlightThemeMode(mode: langDart)},
                  theme: widget.theme,
                ),
              ),
              indicatorBuilder: (context, editingController, chunkController, notifier) {
                return Row(
                  children: [
                    DefaultCodeLineNumber(
                      notifier: notifier,
                      controller: editingController,
                    ),
                    DefaultCodeChunkIndicator(
                      width: 20.0,
                      notifier: notifier,
                      controller: chunkController,
                    ),
                  ],
                );
              },
            ),
          ),
          const Divider(height: 1.0),
          ValueListenableBuilder(
            valueListenable: _controller,
            builder: (context, value, child) {
              final cursorPosition = value.selection.extent;
              final line = cursorPosition.index;
              final col = cursorPosition.offset;
              return ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 20.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Text(
                    'Ln $line, Col $col',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
