import 'package:flutter/material.dart';

class Text_Custom extends StatelessWidget {
  final String text;
  const Text_Custom({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
