import 'package:flutter/material.dart';

class BasicTextWidget extends StatelessWidget {
  const BasicTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Creates a text widget. If the [style] argument is null, the text will use the style from the closest enclosing DefaultTextStyle.',
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.purpleAccent,
      ),
    );
  }
}
