import 'dart:developer';

import 'package:flutter/cupertino.dart';

class ButtonItem extends StatelessWidget {
  const ButtonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoButton(
          onPressed: () {
            log('Button clicked');
          },
          child: const Text('Button'),
        ),
        CupertinoButton(
          onPressed: () {
            log('Button with background clicked');
          },
          color: CupertinoColors.activeBlue,
          child: const Text('With background'),
        ),
      ],
    );
  }
}
