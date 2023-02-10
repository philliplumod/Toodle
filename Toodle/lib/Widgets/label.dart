import 'package:flutter/material.dart';

class LabelWithPadding extends StatelessWidget {
  final String labelText;

  const LabelWithPadding({Key? key, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Text(labelText),
    );
  }
}
