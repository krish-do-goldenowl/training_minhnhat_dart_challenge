import 'package:flutter/cupertino.dart';

class SliderItem extends StatefulWidget {
  const SliderItem({super.key});

  @override
  State<SliderItem> createState() => _SliderItemState();
}

class _SliderItemState extends State<SliderItem> {
  var firstValue = 40.0, secondValue = 30.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: CupertinoSlider(
                value: firstValue,
                min: 0,
                max: 100,
                onChanged: (value) {
                  setState(() {
                    firstValue = value;
                  });
                },
              ),
            ),
            const SizedBox(width: 5),
            Text(firstValue.toStringAsFixed(2)),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CupertinoSlider(
                value: secondValue,
                min: 0,
                max: 100,
                onChanged: (value) {
                  setState(() {
                    secondValue = value;
                  });
                },
              ),
            ),
            const SizedBox(width: 5),
            Text(secondValue.toStringAsFixed(2)),
          ],
        ),
      ],
    );
  }
}
