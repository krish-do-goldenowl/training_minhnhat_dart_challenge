import 'package:flutter/material.dart';

class ElevatedButtons extends StatelessWidget {
  const ElevatedButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
            ),
            child: const Text('Elevated Button'),
          ),
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
            ),
            icon: const Icon(Icons.account_circle_rounded),
            label: const Text('Elevated Button Icon'),
          ),
        ),
      ],
    );
  }
}
