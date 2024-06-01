import 'package:flutter/material.dart';
import 'package:re_editor/re_editor.dart';
import 'package:re_highlight/languages/dart.dart';
import 'package:re_highlight/styles/monokai-sublime.dart';

class CodeField extends StatefulWidget {
  const CodeField({
    super.key,
    this.content,
    this.readOnly = false,
    this.wordWrap = false,
    this.controller,
    this.onContentChanged,
  });

  final String? content;
  final bool readOnly;
  final bool wordWrap;
  final CodeLineEditingController? controller;
  final ValueChanged<String>? onContentChanged;

  @override
  State<CodeField> createState() => _CodeFieldState();
}

class _CodeFieldState extends State<CodeField> {
  late final CodeLineEditingController _controller;

  @override
  void initState() {
    super.initState();

    if (widget.controller != null) {
      _controller = widget.controller!;
      _controller.text = widget.content ?? '';
    } else {
      _controller = CodeLineEditingController.fromText(widget.content);
    }
  }

  @override
  void didUpdateWidget(covariant CodeField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.content != widget.content) {
      _controller.text = widget.content ?? '';
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
      padding: const EdgeInsets.all(8),
      border: Border.all(color: theme.dividerColor),
      onChanged: (value) {
        widget.onContentChanged?.call(_controller.text);
      },
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
