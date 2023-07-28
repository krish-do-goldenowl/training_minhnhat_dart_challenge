import 'package:flutter/material.dart';

class TextButtons extends StatelessWidget {
  const TextButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
          ),
          child: const Text('Text Button'),
        ),
        const SizedBox(height: 5.0),
        TextButton.icon(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
          ),
          icon: const Icon(Icons.account_circle_rounded),
          label: const Text('Text Button Icon'),
        ),
      ],
    );
  }
}
