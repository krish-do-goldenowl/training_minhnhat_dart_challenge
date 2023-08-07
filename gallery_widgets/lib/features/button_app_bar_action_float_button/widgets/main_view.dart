import 'package:flutter/material.dart';
import 'package:gallery_widgets/features/button_app_bar_action_float_button/widgets/radio_buttons_part.dart';
import 'package:gallery_widgets/features/button_app_bar_action_float_button/widgets/switchers_part.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Column(
        children: [
          SwitchersPart(),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          RadioButtonsPart(),
        ],
      ),
    );
  }
}
