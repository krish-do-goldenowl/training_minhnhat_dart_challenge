import 'package:flutter/cupertino.dart';

class SwitchItem extends StatefulWidget {
  const SwitchItem({super.key});

  @override
  State<SwitchItem> createState() => _SwitchItemState();
}

class _SwitchItemState extends State<SwitchItem> {
  var secondValue = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CupertinoSwitch(
          value: false,
          onChanged: null,
        ),
        const SizedBox(height: 10),
        CupertinoSwitch(
          value: secondValue,
          onChanged: (value) {
            setState(() {
              secondValue = value;
            });
          },
        ),
      ],
    );
  }
}
