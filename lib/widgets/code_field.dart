import 'package:flutter/material.dart';
import 'package:re_editor/re_editor.dart';
import 'package:re_highlight/languages/dart.dart';
import 'package:re_highlight/styles/monokai-sublime.dart';

import 'app_decorated_box.dart';

class CodeField extends StatelessWidget {
  const CodeField({
    super.key,
    this.readOnly = false,
    this.wordWrap = false,
    this.controller,
    this.onContentChanged,
  });

  final bool readOnly;
  final bool wordWrap;
  final CodeLineEditingController? controller;
  final ValueChanged<String>? onContentChanged;

  @override
  Widget build(BuildContext context) {
    return AppDecoratedBox(
      child: CodeEditor(
        controller: controller,
        readOnly: readOnly,
        wordWrap: wordWrap,
        padding: EdgeInsets.zero,
        onChanged: (value) => onContentChanged?.call(value.codeLines.asString(TextLineBreak.lf)),
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
      ),
    );
  }
}
