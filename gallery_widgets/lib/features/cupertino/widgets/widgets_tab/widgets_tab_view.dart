import 'package:flutter/cupertino.dart';
import 'package:gallery_widgets/features/cupertino/widgets/widgets_tab/button_item.dart';
import 'package:gallery_widgets/features/cupertino/widgets/widgets_tab/slider_item.dart';
import 'package:gallery_widgets/features/cupertino/widgets/widgets_tab/switch_item.dart';

class WidgetsTabView extends StatelessWidget {
  const WidgetsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: ListView(
        children: [
          buildItem(
            title: 'Indicator',
            mainChild: const CupertinoActivityIndicator(),
          ),
          buildItem(
            title: 'Button',
            mainChild: const ButtonItem(),
          ),
          buildItem(
            title: 'Slider',
            mainChild: const SliderItem(),
          ),
          buildItem(
            title: 'Switch',
            mainChild: const SwitchItem(),
          ),
        ],
      ),
    );
  }

  Widget buildItem({required String title, required Widget mainChild}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          mainChild,
        ],
      ),
    );
  }
}
