import 'package:flutter/material.dart';
import 'package:re_editor/re_editor.dart';
import 'package:re_highlight/languages/dart.dart';
import 'package:re_highlight/styles/monokai-sublime.dart';

class CodeField extends StatefulWidget {
  const CodeField({
    super.key,
    this.data,
    this.readOnly = false,
    this.wordWrap = false,
  });

  final String? data;
  final bool readOnly;
  final bool wordWrap;

  @override
  State<CodeField> createState() => _CodeFieldState();
}

class _CodeFieldState extends State<CodeField> {
  late final CodeLineEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CodeLineEditingController.fromText(widget.data);
  }

  @override
  void didUpdateWidget(covariant CodeField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.data != widget.data) {
      _controller.text = widget.data ?? '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CodeEditor(
      controller: _controller,
      readOnly: widget.readOnly,
      wordWrap: widget.wordWrap,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      border: Border.all(color: theme.dividerColor),
      style: CodeEditorStyle(
        fontSize: 14,
        fontFamily: 'JetBrainsMono',
        codeTheme: CodeHighlightTheme(
          languages: {'dart': CodeHighlightThemeMode(mode: langDart)},
          theme: monokaiSublimeTheme,
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
              width: 20,
              notifier: notifier,
              controller: chunkController,
            ),
          ],
        );
      },
    );
  }
}
