import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_widgets/features/cupertino/widgets/cupertino_app_bar.dart';
import 'package:gallery_widgets/features/cupertino/widgets/widgets_tab/widgets_tab_view.dart';

class CupertinoView extends StatelessWidget {
  const CupertinoView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        border: const Border(
          top: BorderSide(
            color: CupertinoDynamicColor.withBrightness(
              color: Color(0x4D000000),
              darkColor: Color(0x29000000),
            ),
            width: 0.5, // 0.0 means one physical pixel
          ),
        ),
        items: [
          BottomNavigationBarItem(
            icon: buildCupertinoBottomIcon(
              icon: CupertinoIcons.settings,
              text: 'Widget',
            ),
          ),
          BottomNavigationBarItem(
            icon: buildCupertinoBottomIcon(
              icon: CupertinoIcons.collections,
              text: 'Modal',
            ),
          ),
          BottomNavigationBarItem(
            icon: buildCupertinoBottomIcon(
              icon: CupertinoIcons.news,
              text: 'Form',
            ),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        var leadingText = 'Widget';
        Widget widget = const WidgetsTabView();
        if (index == 1) {
          leadingText = 'Modal';
        } else if (index == 2) {
          leadingText = 'Form';
        }

        if (index != 0) {
          widget = Center(
            child: Text('Tab $leadingText'),
          );
        }

        return Scaffold(
          appBar: CupertinoAppBar(title: leadingText),
          body: widget,
        );
      },
    );
  }

  Widget buildCupertinoBottomIcon(
      {required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24,
          ),
          Text(text),
        ],
      ),
    );
  }
}
