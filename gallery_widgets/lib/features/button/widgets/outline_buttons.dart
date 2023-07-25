import 'package:flutter/material.dart';

class OutlineButtons extends StatelessWidget {
  const OutlineButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
            ),
            child: const Text('Outline Button'),
          ),
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
            ),
            icon: const Icon(Icons.account_circle_rounded),
            label: const Text('Outline Button Icon'),
          ),
        ),
      ],
    );
  }
}
