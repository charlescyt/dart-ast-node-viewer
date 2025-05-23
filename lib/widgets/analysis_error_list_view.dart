import 'package:analyzer/error/error.dart' show AnalysisError;
import 'package:flutter/material.dart';

import 'app_decorated_box.dart';

typedef AnalysisErrorCallback = void Function(AnalysisError error);

class AnalysisErrorListView extends StatelessWidget {
  const AnalysisErrorListView({
    super.key,
    required this.errors,
    this.selectedError,
    required this.onErrorSelected,
  });

  final List<AnalysisError> errors;
  final AnalysisError? selectedError;
  final AnalysisErrorCallback onErrorSelected;

  @override
  Widget build(BuildContext context) {
    return AppDecoratedBox(
      child: ListView.builder(
        itemCount: errors.length,
        itemBuilder: (context, index) {
          final error = errors[index];
          return _AnalysisErrorCard(
            error: error,
            selected: error == selectedError,
            onErrorSelected: onErrorSelected,
          );
        },
      ),
    );
  }
}

class _AnalysisErrorCard extends StatelessWidget {
  const _AnalysisErrorCard({
    required this.error,
    this.selected = false,
    required this.onErrorSelected,
  });

  final AnalysisError error;
  final bool selected;
  final AnalysisErrorCallback onErrorSelected;

  @override
  Widget build(BuildContext context) {
    final correctionMessage = error.errorCode.correctionMessage;

    return Card(
      child: ListTile(
        selected: selected,
        title: Text(
          error.message,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: correctionMessage != null
            ? Text(
                correctionMessage,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              )
            : null,
        onTap: () {
          onErrorSelected(error);
        },
      ),
    );
  }
}
