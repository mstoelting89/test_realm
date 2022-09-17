import 'package:flutter/material.dart';

class SaveProgressOverlay extends StatelessWidget {
  final bool isSaving;
  const SaveProgressOverlay({Key? key, required this.isSaving}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isSaving,
      child: Visibility(
        visible: isSaving,
        child: Center(
          child: CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary,),
        ),
      ),
    );
  }
}
