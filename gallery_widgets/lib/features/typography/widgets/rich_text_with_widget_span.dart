import 'package:flutter/material.dart';

class RichTextWithWidgetSpan extends StatelessWidget {
  const RichTextWithWidgetSpan({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 25,
        ),
        children: [
          const TextSpan(
            text: 'First ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const WidgetSpan(
            child: Icon(
              Icons.arrow_forward_rounded,
              color: Colors.redAccent,
              size: 20,
            ),
          ),
          const TextSpan(text: ' second '),
          WidgetSpan(
            child: Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                color: Colors.orangeAccent,
              ),
            ),
          ),
          const TextSpan(text: ' third '),
        ],
      ),
    );
  }
}
