import 'package:flutter/material.dart';

class ColorfulGoogleText extends StatelessWidget {
  const ColorfulGoogleText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          buildWidgetSpan(
            text: 'G',
            color: Colors.blueAccent,
            colorType: 2,
          ),
          buildWidgetSpan(
            text: 'o',
            color: Colors.red,
            isBold: true,
            hasPadding: true,
            colorType: 3,
          ),
          buildWidgetSpan(
            text: 'o',
            color: Colors.yellow,
            isBold: true,
            hasPadding: true,
          ),
          buildWidgetSpan(
            text: 'g',
            color: Colors.blueAccent,
            colorType: 2,
          ),
          buildWidgetSpan(
            text: 'l',
            color: Colors.green,
            colorType: 3,
            isBold: true,
            hasPadding: true,
          ),
          buildWidgetSpan(
            text: 'e',
            color: Colors.red,
            colorType: 2,
          ),
        ],
      ),
    );
  }

  InlineSpan buildWidgetSpan({
    required String text,
    required Color color,
    bool isBold = false,
    bool hasPadding = false,
    int colorType = 1,
  }) {
    Color backgroundColor = Colors.pinkAccent;
    if (colorType == 2) {
      backgroundColor = Colors.pinkAccent.withOpacity(0.5);
    } else if (colorType == 3) {
      backgroundColor = Colors.pinkAccent.withOpacity(0.2);
    }

    return WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: hasPadding ? 5 : 0),
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: color,
          ),
        ),
      ),
    );
  }
}
