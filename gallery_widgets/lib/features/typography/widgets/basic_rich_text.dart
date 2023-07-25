import 'package:flutter/material.dart';

class BasicRichText extends StatelessWidget {
  const BasicRichText({super.key});

  @override
  Widget build(BuildContext context) {
    const size = 15.0;
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          color: Colors.black,
          fontSize: size,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(text: 'One '),
          TextSpan(
            text: 'Two ',
            style: TextStyle(
              fontSize: size + 5,
              fontStyle: FontStyle.italic,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(text: 'Three '),
          TextSpan(text: 'Four '),
          TextSpan(
            text: 'Five',
            style: TextStyle(
              fontSize: size + 5,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
