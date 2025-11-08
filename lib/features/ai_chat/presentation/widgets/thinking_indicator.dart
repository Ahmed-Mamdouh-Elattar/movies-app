import 'package:flutter/material.dart';

class ThinkingIndicator extends StatelessWidget {
  const ThinkingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 8),
        Text("Thinking..."),
        SizedBox(width: 8),
        SizedBox(
          height: 12,
          width: 12,
          child: CircularProgressIndicator(strokeWidth: 1),
        ),
      ],
    );
  }
}
