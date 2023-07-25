import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionButtons extends StatefulWidget {
  const OptionButtons({super.key});

  @override
  State<OptionButtons> createState() => _OptionButtonsState();
}

class _OptionButtonsState extends State<OptionButtons> {
  var optionValue = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CupertinoSegmentedControl<int>(
          onValueChanged: (newValue) {
            setState(() {
              optionValue = newValue;
            });
          },
          borderColor: Colors.grey,
          padding: EdgeInsets.zero,
          selectedColor: Colors.blue.withOpacity(0.1),
          groupValue: optionValue,
          children: {
            1: buildOptionButton(index: 1),
            2: buildOptionButton(index: 2),
            3: buildOptionButton(index: 3),
          },
        ),
      ],
    );
  }

  Widget buildOptionButton({required int index}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      child: Text(
        'Option $index',
        style: TextStyle(
          color: index == optionValue ? Colors.blue : Colors.black,
        ),
      ),
    );
  }
}
